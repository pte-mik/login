<?php namespace Application\Mission\Web\Api;

use Andesite\DBAccess\Connection\Filter\Filter;
use Andesite\Mission\Web\Responder\ApiJsonResponder;
use Application\Ghost\App;
use Application\Ghost\AppPermission;

class Permissions extends ApiJsonResponder{

	/** @on get */
	public function get($app){
		$app = App::search(Filter::where(App::f_name()->is($app)))->pick();
		if (!$app) return [];
		return array_map(function (AppPermission $permission){ return $permission->permission; }, AppPermission::search(Filter::where(AppPermission::f_appId()->is($app->id)))->order('permission')->collect());
	}

}