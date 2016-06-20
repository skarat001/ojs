<?php /* Smarty version 2.6.26, created on 2016-06-20 08:57:08
         compiled from file:C:%5Cxampp%5Chtdocs%5Cojs/plugins/blocks/navigation/block.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'file:C:\\xampp\\htdocs\\ojs/plugins/blocks/navigation/block.tpl', 13, false),array('function', 'url', 'file:C:\\xampp\\htdocs\\ojs/plugins/blocks/navigation/block.tpl', 15, false),array('function', 'call_hook', 'file:C:\\xampp\\htdocs\\ojs/plugins/blocks/navigation/block.tpl', 18, false),array('function', 'html_options_translate', 'file:C:\\xampp\\htdocs\\ojs/plugins/blocks/navigation/block.tpl', 21, false),)), $this); ?>
<!-- 	<?php if (! $this->_tpl_vars['currentJournal'] || $this->_tpl_vars['currentJournal']->getSetting('publishingMode') != @PUBLISHING_MODE_NONE): ?>
	<div class="block" id="sidebarNavigation">
		<span class="blockTitle"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.navigation.journalContent"), $this);?>
</span>

		<form id="simpleSearchForm" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'search','op' => 'search'), $this);?>
">

			<div class="input-group-btn search-panel">
				<?php ob_start(); ?><?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Search::SearchResults::FilterInput",'filterName' => 'simpleQuery','filterValue' => "",'size' => 15), $this);?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('filterInput', ob_get_contents());ob_end_clean(); ?>
				
				<select id="searchField" name="searchField" class="btn btn-default dropdown-toggle form-search">
					<?php echo $this->_plugins['function']['html_options_translate'][0][0]->smartyHtmlOptionsTranslate(array('options' => $this->_tpl_vars['articleSearchByOptions']), $this);?>

				</select>
				
			</div>
			<?php if (empty ( $this->_tpl_vars['filterInput'] )): ?>
			<input type="text" class="form-control form-search" placeholder="Search" id="simpleQuery" name="simpleQuery">
			
				<?php else: ?>
					<?php echo $this->_tpl_vars['filterInput']; ?>

				<?php endif; ?>
			<span class="input-group-btn">
				<button class="btn btn-default form-search" type="submit">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</span>
			
		</form>
		
				

				
				<?php if ($this->_tpl_vars['currentJournal']): ?>
				<span class="blockSubtitle"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.browse"), $this);?>
</span>
				<ul>
					<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'issue','op' => 'archive'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.browseByIssue"), $this);?>
</a></li>
					<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'search','op' => 'authors'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.browseByAuthor"), $this);?>
</a></li>
					<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'search','op' => 'titles'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.browseByTitle"), $this);?>
</a></li>
					<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Plugins::Blocks::Navigation::BrowseBy"), $this);?>

					<?php if ($this->_tpl_vars['hasOtherJournals']): ?>
					<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => 'index'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.otherJournals"), $this);?>
</a></li>
					<?php if ($this->_tpl_vars['siteCategoriesEnabled']): ?><li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => 'index','page' => 'search','op' => 'categories'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.categories"), $this);?>
</a></li><?php endif; ?>
					<?php endif; ?>
				</ul>
				<?php endif; ?>
			</div>
			<?php endif; ?>
 -->