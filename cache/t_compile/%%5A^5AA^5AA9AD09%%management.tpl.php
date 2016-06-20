<?php /* Smarty version 2.6.26, created on 2016-06-20 04:22:51
         compiled from sectionEditor/submission/management.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'sectionEditor/submission/management.tpl', 12, false),array('function', 'url', 'sectionEditor/submission/management.tpl', 24, false),array('function', 'icon', 'sectionEditor/submission/management.tpl', 25, false),array('function', 'html_options', 'sectionEditor/submission/management.tpl', 131, false),array('modifier', 'assign', 'sectionEditor/submission/management.tpl', 24, false),array('modifier', 'escape', 'sectionEditor/submission/management.tpl', 25, false),array('modifier', 'strip_unsafe_html', 'sectionEditor/submission/management.tpl', 35, false),array('modifier', 'to_array', 'sectionEditor/submission/management.tpl', 49, false),array('modifier', 'date_format', 'sectionEditor/submission/management.tpl', 49, false),array('modifier', 'truncate', 'sectionEditor/submission/management.tpl', 70, false),array('modifier', 'concat', 'sectionEditor/submission/management.tpl', 101, false),array('modifier', 'strip_tags', 'sectionEditor/submission/management.tpl', 102, false),array('modifier', 'nl2br', 'sectionEditor/submission/management.tpl', 143, false),)), $this); ?>
	<div id="submission">
		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.submission"), $this);?>
</h3>

		<?php $this->assign('submissionFile', $this->_tpl_vars['submission']->getSubmissionFile()); ?>
		<?php $this->assign('suppFiles', $this->_tpl_vars['submission']->getSuppFiles()); ?>

		<div class="row">
			<div class="col-md-3">
				<strong> 
					<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.authors"), $this);?>

				</strong>
			</div>
			<div class="col-md-6"> 
				<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'email','redirectUrl' => $this->_tpl_vars['currentUrl'],'to' => $this->_tpl_vars['submission']->getAuthorEmails(),'subject' => $this->_tpl_vars['submission']->getLocalizedTitle(),'articleId' => $this->_tpl_vars['submission']->getId()), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'url') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'url'));?>

				<?php echo ((is_array($_tmp=$this->_tpl_vars['submission']->getAuthorString())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
 <?php echo $this->_plugins['function']['icon'][0][0]->smartyIcon(array('name' => 'mail','url' => $this->_tpl_vars['url']), $this);?>

			</div>
		</div>
				<div class="row">
			<div class="col-md-3">
				<strong> 
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.title"), $this);?>

				</strong>
			</div>
			<div class="col-md-6"> 
		<?php echo ((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedTitle())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : String::stripUnsafeHtml($_tmp)); ?>
</td>
			</div>
		</div>

				<div class="row">
			<div class="col-md-3">
			<span class="inline">
				<strong> 
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.originalFile"), $this);?>

				</strong>
				</span>
			</div>
			<div class="col-md-6"> 
		<?php if ($this->_tpl_vars['submissionFile']): ?>
		<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'downloadFile','path' => ((is_array($_tmp=$this->_tpl_vars['submission']->getId())) ? $this->_run_mod_handler('to_array', true, $_tmp, $this->_tpl_vars['submissionFile']->getFileId()) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp, $this->_tpl_vars['submissionFile']->getFileId()))), $this);?>
" class="file"><?php echo ((is_array($_tmp=$this->_tpl_vars['submissionFile']->getFileName())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>&nbsp;&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['submissionFile']->getDateModified())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['dateFormatShort']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['dateFormatShort'])); ?>

		<?php else: ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.none"), $this);?>

		<?php endif; ?>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<span class="inline">
				<strong> 
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.suppFilesAbbrev"), $this);?>

				</strong>
				</span>
			</div>
			<div class="col-md-6"> 
		<?php $_from = $this->_tpl_vars['suppFiles']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['suppFiles'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['suppFiles']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['suppFile']):
        $this->_foreach['suppFiles']['iteration']++;
?>
		<?php if ($this->_tpl_vars['suppFile']->getFileId()): ?>
		<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'downloadFile','path' => ((is_array($_tmp=$this->_tpl_vars['submission']->getId())) ? $this->_run_mod_handler('to_array', true, $_tmp, $this->_tpl_vars['suppFile']->getFileId()) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp, $this->_tpl_vars['suppFile']->getFileId()))), $this);?>
" class="btn btn-link"><?php echo ((is_array($_tmp=$this->_tpl_vars['suppFile']->getFileName())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>
		&nbsp;&nbsp;
		<?php elseif ($this->_tpl_vars['suppFile']->getRemoteURL() != ''): ?>
		<a href="<?php echo ((is_array($_tmp=$this->_tpl_vars['suppFile']->getRemoteURL())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" target="_blank" class="btn btn-link"><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['suppFile']->getRemoteURL())) ? $this->_run_mod_handler('truncate', true, $_tmp, 20, "...") : $this->_plugins['modifier']['truncate'][0][0]->smartyTruncate($_tmp, 20, "...")))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>
		&nbsp;&nbsp;
		<?php endif; ?>
		<?php if ($this->_tpl_vars['suppFile']->getDateModified()): ?>
		<?php echo ((is_array($_tmp=$this->_tpl_vars['suppFile']->getDateModified())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['dateFormatShort']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['dateFormatShort'])); ?>
&nbsp;&nbsp;
		<?php else: ?>
		<?php echo ((is_array($_tmp=$this->_tpl_vars['suppFile']->getDateSubmitted())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['dateFormatShort']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['dateFormatShort'])); ?>
&nbsp;&nbsp;
		<?php endif; ?>
		<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'editSuppFile','from' => 'submission','path' => ((is_array($_tmp=$this->_tpl_vars['submission']->getId())) ? $this->_run_mod_handler('to_array', true, $_tmp, $this->_tpl_vars['suppFile']->getId()) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp, $this->_tpl_vars['suppFile']->getId()))), $this);?>
" class="action"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.edit"), $this);?>
</a>
		&nbsp;|&nbsp;
		<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'deleteSuppFile','from' => 'submission','path' => ((is_array($_tmp=$this->_tpl_vars['submission']->getId())) ? $this->_run_mod_handler('to_array', true, $_tmp, $this->_tpl_vars['suppFile']->getId()) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp, $this->_tpl_vars['suppFile']->getId()))), $this);?>
" onclick="return confirm('<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.confirmDeleteSuppFile"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp, 'jsparam') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'jsparam'));?>
')" class="action"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.delete"), $this);?>
</a>
		<?php if (! $this->_tpl_vars['notFirst']): ?>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'addSuppFile','from' => 'submission','path' => $this->_tpl_vars['submission']->getId()), $this);?>
" class="action"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.addSuppFile"), $this);?>
</a>
		<?php endif; ?>
		<br />
		<?php $this->assign('notFirst', 1); ?>
		<?php endforeach; else: ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.none"), $this);?>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'addSuppFile','from' => 'submission','path' => $this->_tpl_vars['submission']->getId()), $this);?>
" class="btn btn-success"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.addSuppFile"), $this);?>
</a>
		<?php endif; unset($_from); ?>
					</div>
		</div>

				<div class="row">
			<div class="col-md-3">
				<strong> 
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.submitter"), $this);?>

				</strong>
			</div>
			<div class="col-md-6"> 
		<?php $this->assign('submitter', $this->_tpl_vars['submission']->getUser()); ?>
		<?php $this->assign('emailString', ((is_array($_tmp=$this->_tpl_vars['submitter']->getFullName())) ? $this->_run_mod_handler('concat', true, $_tmp, " <", $this->_tpl_vars['submitter']->getEmail(), ">") : $this->_plugins['modifier']['concat'][0][0]->smartyConcat($_tmp, " <", $this->_tpl_vars['submitter']->getEmail(), ">"))); ?>
		<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'email','redirectUrl' => $this->_tpl_vars['currentUrl'],'to' => ((is_array($_tmp=$this->_tpl_vars['emailString'])) ? $this->_run_mod_handler('to_array', true, $_tmp) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp)),'subject' => ((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedTitle)) ? $this->_run_mod_handler('strip_tags', true, $_tmp) : smarty_modifier_strip_tags($_tmp)),'articleId' => $this->_tpl_vars['submission']->getId()), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'url') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'url'));?>

		<?php echo ((is_array($_tmp=$this->_tpl_vars['submitter']->getFullName())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
 <?php echo $this->_plugins['function']['icon'][0][0]->smartyIcon(array('name' => 'mail','url' => $this->_tpl_vars['url']), $this);?>


			</div>
		</div>


				<div class="row">
			<div class="col-md-3">
				<strong> 
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.dateSubmitted"), $this);?>

				</strong>
			</div>
			<div class="col-md-6"> 
		<?php echo ((is_array($_tmp=$this->_tpl_vars['submission']->getDateSubmitted())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['dateFormatShort']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['dateFormatShort'])); ?>


			</div>
		</div>

				<div class="row">
			<div class="col-md-3">
				<strong> 
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "section.section"), $this);?>

				</strong>
			</div>
			<div class="col-md-6"> 
		<?php echo ((is_array($_tmp=$this->_tpl_vars['submission']->getSectionTitle())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

		

		<form action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'updateSection','path' => $this->_tpl_vars['submission']->getId()), $this);?>
" method="post" class="form-inline"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.changeSection"), $this);?>
 <select name="section" size="1" class="form-control "><?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['sections'],'selected' => $this->_tpl_vars['submission']->getSectionId()), $this);?>
</select> <br/><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.record"), $this);?>
" class="btn btn-primary" /></form>
			</div>
		</div>

		<?php if ($this->_tpl_vars['submission']->getCommentsToEditor()): ?>
		<div class="row">
			<div class="col-md-3">
				<strong> 
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.commentsToEditor"), $this);?>

				</strong>
			</div>
			<div class="col-md-6"> 
		<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getCommentsToEditor())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : String::stripUnsafeHtml($_tmp)))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>

	</div>
		</div>
		<?php endif; ?>
		<?php if ($this->_tpl_vars['publishedArticle']): ?>
		<div class="row">
			<div class="col-md-3">
				<strong> 
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.abstractViews"), $this);?>

				</strong>
			</div>
			<div class="col-md-6"> 
		<?php echo $this->_tpl_vars['publishedArticle']->getViews(); ?>

	</div>
		</div>	
		<?php endif; ?>


	</div>
