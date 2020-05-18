<?php namespace Application\Ghost;

use Andesite\Attachment\AttachmentCategoryManager;
use Andesite\DBAccess\Connection\Filter\Filter;
use Andesite\DBAccess\Connection\Filter\Comparison;
use Andesite\DBAccess\Connection\Finder;
use Andesite\Ghost\Field;
use Andesite\Ghost\Ghost;
use Andesite\Ghost\Model;

/**
 * @method static GhostPermissionFinder search(Filter $filter = null)
 * @property-read $id
 * @property-read \Application\Ghost\User $user
 * @property-read \Application\Ghost\App $app
 * @property-read \Application\Ghost\AppPermission $permission
 */
abstract class PermissionGhost extends Ghost{

	/** @var Model */
	public static $model;
	const Table = "permission";
	const ConnectionName = "default";

		public static function f_id(){return new Comparison('id');}
		public static function f_userId(){return new Comparison('userId');}
		public static function f_permissionId(){return new Comparison('permissionId');}
		public static function f_appId(){return new Comparison('appId');}
		public static function f_permission(){return new Comparison('permission');}
		public static function f_app(){return new Comparison('app');}



	const F_id = "id";
	const F_userId = "userId";
	const F_permissionId = "permissionId";
	const F_appId = "appId";
	const F_permission = "permission";
	const F_app = "app";



	/** @var int $id */
	protected $id;
	/** @var int $userId */
	public $userId;
	/** @var int $permissionId */
	public $permissionId;
	/** @var int $appId */
	public $appId;
	/** @var string $permission */
	public $permission;
	/** @var string $app */
	public $app;



	final static protected function createModel(): Model{
		$model = new Model(get_called_class());
		$model->addField("id", Field::TYPE_INT,null);
		$model->addField("userId", Field::TYPE_ID,null);
		$model->addField("permissionId", Field::TYPE_ID,null);
		$model->addField("appId", Field::TYPE_ID,null);
		$model->addField("permission", Field::TYPE_STRING,null);
		$model->addField("app", Field::TYPE_STRING,null);
		$model->protectField("id");
		$model->addValidator("id", new \Symfony\Component\Validator\Constraints\NotNull());
		$model->addValidator("id", new \Symfony\Component\Validator\Constraints\Type('int'));
		$model->addValidator("userId", new \Symfony\Component\Validator\Constraints\Type('int'));
		$model->addValidator("userId", new \Symfony\Component\Validator\Constraints\PositiveOrZero());
		$model->addValidator("permissionId", new \Symfony\Component\Validator\Constraints\Type('int'));
		$model->addValidator("permissionId", new \Symfony\Component\Validator\Constraints\PositiveOrZero());
		$model->addValidator("appId", new \Symfony\Component\Validator\Constraints\Type('int'));
		$model->addValidator("appId", new \Symfony\Component\Validator\Constraints\PositiveOrZero());
		$model->addValidator("permission", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("permission", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		$model->addValidator("app", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("app", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		return $model;
	}
}

/**
 * Nobody uses this class, it exists only to help the code completion
 * @method \Application\Ghost\Permission[] collect($limit = null, $offset = null)
 * @method \Application\Ghost\Permission[] collectPage($pageSize, $page, &$count = 0)
 * @method \Application\Ghost\Permission pick()
 */
abstract class GhostPermissionFinder extends Finder {}