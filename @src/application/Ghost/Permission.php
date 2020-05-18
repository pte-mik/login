<?php namespace Application\Ghost;

use Andesite\DBAccess\Connection\Filter\Filter;

class Permission extends PermissionGhost{
	public static function add($userId, $permissionId){
		static::$model->connection->createSmartAccess()->insert('user_permission', ['userId' => $userId, 'permissionId' => $permissionId], true);
	}

	public static function remove($userId, $permissionId){
		static::$model->connection->createSmartAccess()->delete('user_permission', Filter::where('userId=$1', $userId)->and('permissionId=$1', $permissionId));
	}

	public static function set($userId, array $permissionIds){
		$access = static::$model->connection->createSmartAccess();
		$access->delete('user_permission', Filter::where('userId=$1', $userId)->andIf(count($permissionIds), 'permissionId not in ($1)', $permissionIds));
		foreach ($permissionIds as $permissionId) $access->insert('user_permission', ['userId' => $userId, 'permissionId' => $permissionId], true);
	}

	public static function getPermissionIds($userId){
		return static::$model->connection->createSmartAccess()->getValues("select permissionId from user_permission where userId = $1", $userId);
	}

	public static function getUserIds($permissionId){
		return static::$model->connection->createSmartAccess()->getValues("select userId from user_permission where permissionId = $1", $permissionId);
	}
}
