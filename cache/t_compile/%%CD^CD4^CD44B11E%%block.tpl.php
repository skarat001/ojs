<?php /* Smarty version 2.6.26, created on 2016-06-15 20:21:38
         compiled from file:C:%5Cxampp%5Chtdocs%5Cojs2%5Cojs/plugins/blocks/information/block.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/blocks/information/block.tpl', 16, false),array('function', 'url', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/blocks/information/block.tpl', 20, false),)), $this); ?>
<?php if (! empty ( $this->_tpl_vars['forReaders'] ) || ! empty ( $this->_tpl_vars['forAuthors'] ) || ! empty ( $this->_tpl_vars['forLibrarians'] )): ?>


<div class="panel panel-default" id="sidebarInformation">
	 <div class="panel-heading">
	<span class="blockTitle"><i class="fa fa-info fa-1x" > </i> <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.information.link"), $this);?>
</span>
	</div>
	 <div class="panel-body">
	<ul>
		<?php if (! empty ( $this->_tpl_vars['forReaders'] )): ?><li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'information','op' => 'readers'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.infoForReaders"), $this);?>
</a></li><?php endif; ?>
		<?php if (! empty ( $this->_tpl_vars['forAuthors'] )): ?><li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'information','op' => 'authors'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.infoForAuthors"), $this);?>
</a></li><?php endif; ?>
		<?php if (! empty ( $this->_tpl_vars['forLibrarians'] )): ?><li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'information','op' => 'librarians'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.infoForLibrarians"), $this);?>
</a></li><?php endif; ?>
	</ul>
	</div>
</div>
<?php endif; ?>