<?php namespace Application\Ghost;

use Andesite\Attachment\AttachmentCategoryManager;
use Andesite\DBAccess\Connection\Filter\Filter;
use Andesite\DBAccess\Connection\Filter\Comparison;
use Andesite\DBAccess\Connection\Finder;
use Andesite\Ghost\Field;
use Andesite\Ghost\Ghost;
use Andesite\Ghost\Model;

/**
 * @method static GhostAppFinder search(Filter $filter = null)
 * @property-read $id
 */
abstract class AppGhost extends Ghost{

	/** @var Model */
	public static $model;
	const Table = "app";
	const ConnectionName = "default";

		public static function f_id(){return new Comparison('id');}
		public static function f_name(){return new Comparison('name');}
		public static function f_return(){return new Comparison('return');}
		public static function f_title(){return new Comparison('title');}



	const F_id = "id";
	const F_name = "name";
	const F_return = "return";
	const F_title = "title";



	/** @var int $id */
	protected $id;
	/** @var string $name */
	public $name;
	/** @var string $return */
	public $return;
	/** @var string $title */
	public $title;



	final static protected function createModel(): Model{
		$model = new Model(get_called_class());
		$model->addField("id", Field::TYPE_ID,null);
		$model->addField("name", Field::TYPE_STRING,null);
		$model->addField("return", Field::TYPE_STRING,null);
		$model->addField("title", Field::TYPE_STRING,null);
		$model->protectField("id");
		$model->addValidator("id", new \Symfony\Component\Validator\Constraints\Type('int'));
		$model->addValidator("id", new \Symfony\Component\Validator\Constraints\PositiveOrZero());
		$model->addValidator("name", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("name", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		$model->addValidator("return", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("return", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		$model->addValidator("title", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("title", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		return $model;
	}
}

/**
 * Nobody uses this class, it exists only to help the code completion
 * @method \Application\Ghost\App[] collect($limit = null, $offset = null)
 * @method \Application\Ghost\App[] collectPage($pageSize, $page, &$count = 0)
 * @method \Application\Ghost\App pick()
 */
abstract class GhostAppFinder extends Finder {}