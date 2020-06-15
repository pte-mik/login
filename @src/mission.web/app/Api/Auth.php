<?php namespace Application\Mission\Web\Api;

use Andesite\Core\ServiceManager\ServiceContainer;
use Andesite\DBAccess\Connection\Filter\Filter;
use Andesite\Mission\Web\Action\NotAuthorized;
use Andesite\Mission\Web\Responder\ApiJsonResponder;
use Andesite\Zuul\Interfaces\AuthServiceInterface;
use Application\Component\Constant\Permission\Role;
use Application\Ghost\App;
use Application\Ghost\User;
use Application\Service\Auth\AuthGateway;
use Application\Service\Auth\AuthRepository;
use Application\Service\Auth\JWT;

class Auth extends ApiJsonResponder{

	/**
	 * @accepts get
	 * @action  login
	 */
	public function login_get(){
		return $this->login(
			$this->getQueryBag()->get('app'),
			$this->getQueryBag()->get('login'),
			$this->getQueryBag()->get('password')
		);
	}

	/**
	 * @accepts post
	 * @action  login
	 */
	public function login_post(){
		return $this->login(
			$this->getJsonParamBag()->get('app'),
			$this->getJsonParamBag()->get('login'),
			$this->getJsonParamBag()->get('password'),
			true
		);
	}

	/**
	 * @accepts post
	 * @action  auth
	 */
	public function auth(){
		$login = $this->getJsonParamBag()->get('login');
		$password = $this->getJsonParamBag()->get('password');
		$data = AuthGateway::Service()->login($login, $password);
		if ($data['status'] === 'success') return $data['user'];
		else $this->break(NotAuthorized::class);
	}

	private function login($app, $login, $password, $token = false){
		$app = App::search(Filter::where(App::f_name()->is($app)))->pick();

		if ($app){

			/** @var AuthRepository $authRepository */
			$authRepository = ServiceContainer::get(AuthRepository::class);
			$user = $authRepository->authLoginLookup($login);
			if (!is_null($user)){
				if ($user->checkPassword($password)){
					$user = User::pick($user->getId());
				}else{
					$user = null;
				}
			}

			if (is_null($user)){
				$data = AuthGateway::Service()->login($login, $password);
				if ($data['status'] === 'success'){
					$eha = $data['user']['eha'];
					$user = User::search(Filter::where(User::f_login()->is($eha)))->pick();
				}
			}

			if ($user && $user->checkRole(Role::Active)){
				if ($token){
					$token = JWT::Service()->create(['userid' => $user->id, 'appid' => $app->id])->__toString();
					return ['url' => str_replace('{{token}}', $token, $app->return)];
				}else{
					return $user->publish();
				}
			}
		}

		$this->break(NotAuthorized::class);

	}

	/** @accepts get */
	public function fetch($token){
		if (!JWT::Service()->isValid($token)) return null;
		$token = JWT::Service()->parse($token);
		$user = User::pick((int)$token['userid']);
		if (!$user) return null;
		return $user->publish();
	}

}