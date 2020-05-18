<?php namespace Application\AdminCodex\GhostHelper;

use Andesite\Codex\Form\AdminDescriptor;
use Andesite\Codex\Form\DataProvider\GhostDataProvider;
use Andesite\Codex\Form\Field;
use Andesite\Codex\Interfaces\DataProviderInterface;

/**
 * @label-field id: 
 * @label-field userId: 
 * @label-field permissionId: 
 * @label-field appId: 
 * @label-field permission: 
 * @label-field app: 
 */
abstract class PermissionGhostCodexHelper extends AdminDescriptor{


	/** @var Field */ protected $id;
	/** @var Field */ protected $userId;
	/** @var Field */ protected $permissionId;
	/** @var Field */ protected $appId;
	/** @var Field */ protected $permission;
	/** @var Field */ protected $app;

	public function __construct(){
		$this->id = new Field('id', 'id');
		$this->userId = new Field('userId', 'userId');
		$this->permissionId = new Field('permissionId', 'permissionId');
		$this->appId = new Field('appId', 'appId');
		$this->permission = new Field('permission', 'permission');
		$this->app = new Field('app', 'app');
	}

	protected function createDataProvider(): DataProviderInterface{
		return new GhostDataProvider(\Application\Ghost\Permission::class);
	}

}
