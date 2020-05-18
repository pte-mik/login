<?php namespace Application\Mission\Web\Api;

use Andesite\DBAccess\Connection\Filter\Filter;
use Andesite\Mission\Web\Responder\ApiJsonResponder;
use Application\Ghost\App;
use Application\Ghost\Permission;

class User extends ApiJsonResponder{


	/** @on get */
	public function get($id){
		$user = \Application\Ghost\User::pick($id);
		return $user ? $user->publish() : null;
	}

	/** @accepts get */
	public function search($keyword){
		$users = \Application\Ghost\User::search(Filter::where(\Application\Ghost\User::f_name()->instring($keyword)))->asc('name')->collect();
		return array_map(function (\Application\Ghost\User $user){ return $user->publish(); }, $users);
	}

	/** @accepts get */
	public function collect($ids){
		$ids = explode(',', $ids);
		$users = \Application\Ghost\User::collect($ids);
		return array_map(function (\Application\Ghost\User $user){ return $user->publish(); }, $users);
	}

	/** @accepts get */
	public function permissions($app, $userId){
		$app = App::search(Filter::where(App::f_name()->is($app)))->pick();
		if (!$app) return [];
		return array_map(function (Permission $permission){ return $permission->permission; }, Permission::search(Filter::where(Permission::f_appId()->is($app->id))->and(Permission::f_userId()->is($userId)))->collect());
	}

}