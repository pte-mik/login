<?php namespace Application\Service\Auth;

use Andesite\Core\ServiceManager\Service;
use Andesite\Core\ServiceManager\SharedService;
use Unirest\Request;

class AuthGateway implements SharedService{

	use Service;

	public function login($login, $password) {
		$post = [
			'eha'        => $login,
			'pwd'        => $password,
			'session_id' => session_id(),
			'token'      => $this->token($login, $password),
		];
		$response = Request::post('http://auth2.dev.mik.pte.hu/login', ['Accept' => 'application/json'], Request\Body::form($post));
		return json_decode($response->raw_body, true);
	}


	protected function token($eha, $password) {
		return str_replace(
			['$1', '$2', '$3'],
			[
				date('d') . sha1($eha . date('dYm')),
				date('dY') . sha1($password . date('Y')),
				sha1(date('mY') . session_id()) . date('YY'),
			],
			"6mxvwU6VCvXS85pbmKRhpZeM$1JYvgAnK9K6dXny5pfT8yTXEEmz$2swyRhuSUmS3Ywvg8G$3v3JqyX"
		);
	}

}