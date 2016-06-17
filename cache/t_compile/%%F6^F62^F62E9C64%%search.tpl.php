<?php /* Smarty version 2.6.26, created on 2016-06-16 11:51:50
         compiled from search/search.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'search/search.tpl', 23, false),array('function', 'translate', 'search/search.tpl', 26, false),array('function', 'call_hook', 'search/search.tpl', 29, false),array('function', 'html_options', 'search/search.tpl', 50, false),array('function', 'page_info', 'search/search.tpl', 229, false),array('function', 'page_links', 'search/search.tpl', 231, false),array('modifier', 'escape', 'search/search.tpl', 31, false),array('modifier', 'strip_unsafe_html', 'search/search.tpl', 174, false),array('modifier', 'to_array', 'search/search.tpl', 207, false),array('block', 'iterate', 'search/search.tpl', 155, false),)), $this); ?>
	<?php echo ''; ?><?php $this->assign('pageTitle', "navigation.search"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>



	<script type="text/javascript">
		$(function() {
			// Attach the form handler.
			$('#searchForm').pkpHandler('$.pkp.pages.search.SearchFormHandler');
			});
	</script>

	<form id="searchForm" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'search'), $this);?>
" class="form-horizontal">
		<div class="form-group">
			<label class="col-md-3 control-label">
				<label for="query"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "search.searchAllCategories"), $this);?>
</label>
			</label>
			<div class="col-md-5">
				<?php ob_start(); ?><?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Search::SearchResults::FilterInput",'filterName' => 'query','filterValue' => $this->_tpl_vars['query']), $this);?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('queryFilter', ob_get_contents());ob_end_clean(); ?>
				<?php if (empty ( $this->_tpl_vars['queryFilter'] )): ?>
				<input type="text" id="query" name="query" size="40" maxlength="255" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['query'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" class="form-control" />
				<?php else: ?>
				<?php echo $this->_tpl_vars['queryFilter']; ?>

				<?php endif; ?>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-5 col-md-offset-3">
				<input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.search"), $this);?>
" class="btn btn-default" />
			</div>
		</div>

		<?php if ($this->_tpl_vars['siteSearch']): ?>
		<div class="form-group">
			<label class="col-md-3 control-label">
				<label for="searchJournal"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "search.withinJournal"), $this);?>
</label>
			</label>
			<div class="col-md-5">
				<select name="searchJournal" id="searchJournal" class="selectMenu"><?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['journalOptions'],'selected' => $this->_tpl_vars['searchJournal']), $this);?>
</select>
			</div>
		</div>

		<?php endif; ?>
		<?php if ($this->_tpl_vars['hasActiveFilters']): ?>

		<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "search.activeFilters"), $this);?>
</h4>

		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'authors','filterValue' => $this->_tpl_vars['authors'],'key' => "search.author")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'title','filterValue' => $this->_tpl_vars['title'],'key' => "article.title")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'abstract','filterValue' => $this->_tpl_vars['abstract'],'key' => "search.abstract")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'galleyFullText','filterValue' => $this->_tpl_vars['galleyFullText'],'key' => "search.fullText")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'suppFiles','filterValue' => $this->_tpl_vars['suppFiles'],'key' => "article.suppFiles")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterType' => 'date','filterName' => 'dateFrom','filterValue' => $this->_tpl_vars['dateFrom'],'startYear' => $this->_tpl_vars['startYear'],'endYear' => $this->_tpl_vars['endYear'],'key' => "search.dateFrom")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterType' => 'date','filterName' => 'dateTo','filterValue' => $this->_tpl_vars['dateTo'],'startYear' => $this->_tpl_vars['startYear'],'endYear' => $this->_tpl_vars['endYear'],'key' => "search.dateTo")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'discipline','filterValue' => $this->_tpl_vars['discipline'],'key' => "search.discipline")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'subject','filterValue' => $this->_tpl_vars['subject'],'key' => "search.subject")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'type','filterValue' => $this->_tpl_vars['type'],'key' => "search.typeMethodApproach")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'coverage','filterValue' => $this->_tpl_vars['coverage'],'key' => "search.coverage")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'activeFilter','filterName' => 'indexTerms','filterValue' => $this->_tpl_vars['indexTerms'],'key' => "search.indexTermsLong")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>


		<?php if ($this->_tpl_vars['hasEmptyFilters']): ?>
		<div class="panel panel-default">
			<div class="panel-heading" >
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#one"  > <span style="display: block;">	<?php ob_start(); ?></span></a>
				</h4>
			</div>
			<div id="one" class="panel-collapse collapse ">
				<div class="panel-body">


						<?php if (empty ( $this->_tpl_vars['authors'] ) || empty ( $this->_tpl_vars['title'] ) || empty ( $this->_tpl_vars['abstract'] ) || empty ( $this->_tpl_vars['galleyFullText'] ) || empty ( $this->_tpl_vars['suppFiles'] )): ?>
							
							<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "search.searchCategories"), $this);?>
</h4>

						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'authors','filterValue' => $this->_tpl_vars['authors'],'key' => "search.author")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'title','filterValue' => $this->_tpl_vars['title'],'key' => "article.title")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'abstract','filterValue' => $this->_tpl_vars['abstract'],'key' => "search.abstract")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'galleyFullText','filterValue' => $this->_tpl_vars['galleyFullText'],'key' => "search.fullText")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'suppFiles','filterValue' => $this->_tpl_vars['suppFiles'],'key' => "article.suppFiles")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						<?php if ($this->_tpl_vars['dateFrom'] == '--' || $this->_tpl_vars['dateTo'] == '--'): ?>

						<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "search.date"), $this);?>
</h4>

						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterType' => 'date','filterName' => 'dateFrom','filterValue' => $this->_tpl_vars['dateFrom'],'startYear' => $this->_tpl_vars['startYear'],'endYear' => $this->_tpl_vars['endYear'],'key' => "search.dateFrom")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterType' => 'date','filterName' => 'dateTo','filterValue' => $this->_tpl_vars['dateTo'],'startYear' => $this->_tpl_vars['startYear'],'endYear' => $this->_tpl_vars['endYear'],'key' => "search.dateTo")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						<?php if (empty ( $this->_tpl_vars['discipline'] ) || empty ( $this->_tpl_vars['subject'] ) || empty ( $this->_tpl_vars['type'] ) || empty ( $this->_tpl_vars['coverage'] )): ?>

							<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "search.indexTerms"), $this);?>
</h4>

						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'discipline','filterValue' => $this->_tpl_vars['discipline'],'key' => "search.discipline")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'subject','filterValue' => $this->_tpl_vars['subject'],'key' => "search.subject")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'type','filterValue' => $this->_tpl_vars['type'],'key' => "search.typeMethodApproach")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'coverage','filterValue' => $this->_tpl_vars['coverage'],'key' => "search.coverage")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "search/searchFilter.tpl", 'smarty_include_vars' => array('displayIf' => 'emptyFilter','filterName' => 'indexTerms','filterValue' => $this->_tpl_vars['indexTerms'],'key' => "search.indexTermsLong")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>

					<p><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.search"), $this);?>
" class="button defaultButton" /></p>
					<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('emptyFilters', ob_get_contents());ob_end_clean(); ?>
					<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "controllers/extrasOnDemand.tpl", 'smarty_include_vars' => array('id' => 'emptyFilters','moreDetailsText' => "search.advancedSearchMore",'lessDetailsText' => "search.advancedSearchLess",'extraContent' => $this->_tpl_vars['emptyFilters'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>





					<?php endif; ?>

				</div>
			</div>

		</form>



		<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Search::SearchResults::PreResults"), $this);?>


		<?php if ($this->_tpl_vars['currentJournal']): ?>
		<?php $this->assign('numCols', 3); ?>
		<?php else: ?>
		<?php $this->assign('numCols', 4); ?>
		<?php endif; ?>


			

<!-- 				<?php if (! $this->_tpl_vars['currentJournal']): ?>


				<h4 class="text-capitalize"><strong><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "journal.journal"), $this);?>

</strong></h4>
				<?php endif; ?>
				
				<h4 class="text-capitalize"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "issue.issue"), $this);?>

</h4>
<h4 class="text-capitalize"><strong>
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.title"), $this);?>

</strong></h4> -->


			<?php $this->_tag_stack[] = array('iterate', array('from' => 'results','item' => 'result')); $_block_repeat=true;$this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
					<div class="col-md-6">
		<div class="panel panel-default">
<div class="panel-heading">
		<div  class="row container">
			<?php $this->assign('publishedArticle', $this->_tpl_vars['result']['publishedArticle']); ?>
			<?php $this->assign('article', $this->_tpl_vars['result']['article']); ?>
			<?php $this->assign('issue', $this->_tpl_vars['result']['issue']); ?>
			<?php $this->assign('issueAvailable', $this->_tpl_vars['result']['issueAvailable']); ?>
			<?php $this->assign('journal', $this->_tpl_vars['result']['journal']); ?>
			<?php $this->assign('section', $this->_tpl_vars['result']['section']); ?>
				<?php if (! $this->_tpl_vars['currentJournal']): ?>
				
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => $this->_tpl_vars['journal']->getPath()), $this);?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['journal']->getLocalizedTitle())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>
				<?php endif; ?>

				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => $this->_tpl_vars['journal']->getPath(),'page' => 'issue','op' => 'view','path' => $this->_tpl_vars['issue']->getBestIssueId($this->_tpl_vars['journal'])), $this);?>
"><h4 class="text-capitalize"><?php echo ((is_array($_tmp=$this->_tpl_vars['issue']->getIssueIdentification())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</h4></a>

				<h4 class="text-capitalize"><strong>
				<?php echo ((is_array($_tmp=$this->_tpl_vars['article']->getLocalizedTitle())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : String::stripUnsafeHtml($_tmp)); ?>

</strong>
</h4>
<?php $_from = $this->_tpl_vars['article']->getAuthors(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['authorList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['authorList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['authorItem']):
        $this->_foreach['authorList']['iteration']++;
?>
					<p><?php echo ((is_array($_tmp=$this->_tpl_vars['authorItem']->getFullName())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
<?php if (! ($this->_foreach['authorList']['iteration'] == $this->_foreach['authorList']['total'])): ?>,<?php endif; ?>
</p>
					<?php endforeach; endif; unset($_from); ?>

					<?php if ($this->_tpl_vars['publishedArticle']->getAccessStatus() == @ARTICLE_ACCESS_OPEN || $this->_tpl_vars['issueAvailable']): ?>
					<?php $this->assign('hasAccess', 1); ?>
					<?php else: ?>
					<?php $this->assign('hasAccess', 0); ?>
					<?php endif; ?>
					<?php if ($this->_tpl_vars['publishedArticle']->getLocalizedAbstract() != ""): ?>
					<?php $this->assign('hasAbstract', 1); ?>
					<?php else: ?>
					<?php $this->assign('hasAbstract', 0); ?>
					<?php endif; ?>
					<?php if (! $this->_tpl_vars['hasAccess'] || $this->_tpl_vars['hasAbstract']): ?>
					<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => $this->_tpl_vars['journal']->getPath(),'page' => 'article','op' => 'view','path' => $this->_tpl_vars['publishedArticle']->getBestArticleId($this->_tpl_vars['journal'])), $this);?>
" class="file">
						<strong>
						<?php if (! $this->_tpl_vars['hasAbstract']): ?>
						<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.details"), $this);?>

						<?php else: ?>
						<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.abstract"), $this);?>

						<?php endif; ?>
						</strong>
					</a>
					<br>
					<?php endif; ?>
					<?php if ($this->_tpl_vars['hasAccess']): ?>
					<?php $_from = $this->_tpl_vars['publishedArticle']->getGalleys(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['galleyList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['galleyList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['galley']):
        $this->_foreach['galleyList']['iteration']++;
?>
					<br>
				<i class="fa fa-download" ></i><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => $this->_tpl_vars['journal']->getPath(),'page' => 'article','op' => 'view','path' => ((is_array($_tmp=$this->_tpl_vars['publishedArticle']->getBestArticleId($this->_tpl_vars['journal']))) ? $this->_run_mod_handler('to_array', true, $_tmp, $this->_tpl_vars['galley']->getBestGalleyId($this->_tpl_vars['journal'])) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp, $this->_tpl_vars['galley']->getBestGalleyId($this->_tpl_vars['journal'])))), $this);?>
" class="file"><?php echo ((is_array($_tmp=$this->_tpl_vars['galley']->getGalleyLabel())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>
					<?php endforeach; endif; unset($_from); ?>
					<?php endif; ?>
					<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Search::SearchResults::AdditionalArticleLinks",'articleId' => $this->_tpl_vars['publishedArticle']->getId()), $this);?>

			

					
			<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Search::SearchResults::AdditionalArticleInfo",'articleId' => $this->_tpl_vars['publishedArticle']->getId(),'numCols' => ((is_array($_tmp=$this->_tpl_vars['numCols'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))), $this);?>

</div>
</div>
</div>
</div>
			<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
			<?php if ($this->_tpl_vars['results']->wasEmpty()): ?>

					<?php if ($this->_tpl_vars['error']): ?>
					<?php echo ((is_array($_tmp=$this->_tpl_vars['error'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

					<?php else: ?>
					<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "search.noResults"), $this);?>

					<?php endif; ?>
			
			<?php else: ?>
				<?php echo $this->_plugins['function']['page_info'][0][0]->smartyPageInfo(array('iterator' => $this->_tpl_vars['results']), $this);?>

				
				<?php echo $this->_plugins['function']['page_links'][0][0]->smartyPageLinks(array('anchor' => 'results','iterator' => $this->_tpl_vars['results'],'name' => 'search','query' => $this->_tpl_vars['query'],'searchJournal' => $this->_tpl_vars['searchJournal'],'authors' => $this->_tpl_vars['authors'],'title' => $this->_tpl_vars['title'],'abstract' => $this->_tpl_vars['abstract'],'galleyFullText' => $this->_tpl_vars['galleyFullText'],'suppFiles' => $this->_tpl_vars['suppFiles'],'discipline' => $this->_tpl_vars['discipline'],'subject' => $this->_tpl_vars['subject'],'type' => $this->_tpl_vars['type'],'coverage' => $this->_tpl_vars['coverage'],'indexTerms' => $this->_tpl_vars['indexTerms'],'dateFromMonth' => $this->_tpl_vars['dateFromMonth'],'dateFromDay' => $this->_tpl_vars['dateFromDay'],'dateFromYear' => $this->_tpl_vars['dateFromYear'],'dateToMonth' => $this->_tpl_vars['dateToMonth'],'dateToDay' => $this->_tpl_vars['dateToDay'],'dateToYear' => $this->_tpl_vars['dateToYear'],'orderBy' => $this->_tpl_vars['orderBy'],'orderDir' => $this->_tpl_vars['orderDir']), $this);?>

			
			<?php endif; ?>
		

		<?php ob_start(); ?><?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Search::SearchResults::SyntaxInstructions"), $this);?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('syntaxInstructions', ob_get_contents());ob_end_clean(); ?>
		<?php if (empty ( $this->_tpl_vars['syntaxInstructions'] )): ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "search.syntaxInstructions"), $this);?>

		<?php else: ?>
				<?php echo $this->_tpl_vars['syntaxInstructions']; ?>

		<?php endif; ?>


		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
