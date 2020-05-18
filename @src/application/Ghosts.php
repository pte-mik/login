<?php namespace Application;

use Andesite\Ghost\Decorator;
use Application\Ghost\App;
use Application\Ghost\AppPermission;
use Application\Ghost\Permission;
use Application\Ghost\User;

/**
 * @ghost User
 * @ghost App
 * @ghost AppPermission:app_permission
 * @ghost Permission
 */
class Ghosts{

	public function user(Decorator $decorator){
		$decorator->protectField('password', false, true);
		$decorator->hasAttachment('avatar')->maxFileCount(1)->acceptExtensions('png', 'jpg')->maxFileSize(500 * 1024);
		$decorator->hasMany('permissions', Permission::class, 'userId');
	}

	public function permission(Decorator $decorator){
		$decorator->immutable();
		$decorator->belongsTo('user', User::class);
		$decorator->belongsTo('app', App::class);
		$decorator->belongsTo('permission', AppPermission::class);
	}

	public function appPermission(Decorator $decorator){
		$decorator->belongsTo('app', App::class);
	}

}