<?php namespace Application\Service\Auth;

use Andesite\Core\Env\Env;
use Andesite\Core\ServiceManager\Service;
use Andesite\Core\ServiceManager\SharedService;
use Lcobucci\JWT\Configuration;
use Lcobucci\JWT\Signer\Key;
use Lcobucci\JWT\Token;

class JWT implements SharedService{

	use Service;

	private Key $key;
	private \Lcobucci\JWT\Signer\Hmac\Sha256 $signer;

	public function __construct(){
		$this->signer = new \Lcobucci\JWT\Signer\Hmac\Sha256();
		$this->key = new Key(Env::Service()->get('app.jwt.key'));
	}

	public function getConfiguration():Configuration{
		return Configuration::forSymmetricSigner($this->signer, $this->key);
	}

	public function create(array $claims = []): Token\Plain{
		$builder = $this->getConfiguration()
			->createBuilder()
			->issuedBy(Env::Service()->get('app.jwt.issuer'))
			->issuedAt(new \DateTimeImmutable())
			->expiresAt(( new \DateTimeImmutable() )->modify(Env::Service()->get('app.jwt.leeway')));
		foreach ($claims as $key=> $value) $builder->withClaim($key, $value);
		return $builder->getToken($this->signer, $this->key);
	}

	public function isValid($token){
		/** @var \Lcobucci\JWT\Token\Plain $token */
		$token = $this->getConfiguration()->getParser()->parse($token);
		return !$token->isExpired(new \DateTime());
	}

	public function parse($token){
		return $this->getConfiguration()->getParser()->parse($token)->claims()->all();
	}

}