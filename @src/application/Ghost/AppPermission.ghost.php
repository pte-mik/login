<?php namespace Application\Ghost;

use Andesite\Attachment\AttachmentCategoryManager;
use Andesite\DBAccess\Connection\Filter\Filter;
use Andesite\DBAccess\Connection\Filter\Comparison;
use Andesite\DBAccess\Connection\Finder;
use Andesite\Ghost\Field;
use Andesite\Ghost\Ghost;
use Andesite\Ghost\Model;

/**
 * @method static GhostAppPermissionFinder search(Filter $filter = null)
 * @property-read $id
 * @property-read \Application\Ghost\App $app
 */
abstract class AppPermissionGhost extends Ghost{

	/** @var Model */
	public static $model;
	const Table = "app_permission";
	const ConnectionName = "default";

		public static function f_id(){return new Comparison('id');}
		public static function f_permission(){return new Comparison('permission');}
		public static function f_appId(){return new Comparison('appId');}



	const F_id = "id";
	const F_permission = "permission";
	const F_appId = "appId";



	/** @var int $id */
	protected $id;
	/** @var string $permission */
	public $permission;
	/** @var int $appId */
	public $appId;



	final static protected function createModel(): Model{
		$model = new Model(get_called_class());
		$model->addField("id", Field::TYPE_ID,null);
		$model->addField("permission", Field::TYPE_STRING,null);
		$model->addField("appId", Field::TYPE_ID,null);
		$model->protectField("id");
		$model->addValidator("id", new \Symfony\Component\Validator\Constraints\Type('int'));
		$model->addValidator("id", new \Symfony\Component\Validator\Constraints\PositiveOrZero());
		$model->addValidator("permission", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("permission", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		$model->addValidator("appId", new \Symfony\Component\Validator\Constraints\Type('int'));
		$model->addValidator("appId", new \Symfony\Component\Validator\Constraints\PositiveOrZero());
		return $model;
	}
}

/**
 * Nobody uses this class, it exists only to help the code completion
 * @method \Application\Ghost\AppPermission[] collect($limit = null, $offset = null)
 * @method \Application\Ghost\AppPermission[] collectPage($pageSize, $page, &$count = 0)
 * @method \Application\Ghost\AppPermission pick()
 */
abstract class GhostAppPermissionFinder extends Finder {}