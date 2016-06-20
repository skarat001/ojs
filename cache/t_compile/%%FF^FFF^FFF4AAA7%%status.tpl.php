<?php /* Smarty version 2.6.26, created on 2016-06-19 16:17:32
         compiled from sectionEditor/submission/status.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'sectionEditor/submission/status.tpl', 11, false),array('function', 'url', 'sectionEditor/submission/status.tpl', 32, false),array('function', 'html_options_translate', 'sectionEditor/submission/status.tpl', 67, false),array('modifier', 'escape', 'sectionEditor/submission/status.tpl', 25, false),array('modifier', 'date_format', 'sectionEditor/submission/status.tpl', 47, false),)), $this); ?>
	<div id="status">
		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.status"), $this);?>
</h3>

		<?php $this->assign('status', $this->_tpl_vars['submission']->getSubmissionStatus()); ?>
		<div class="row">
			<div class="col-md-3">
				<strong>		
					<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.status"), $this);?>

				</strong>
			</div>
			<div class="col-md-5"> 
				<?php if ($this->_tpl_vars['status'] == STATUS_ARCHIVED): ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submissions.archived"), $this);?>

				<?php elseif ($this->_tpl_vars['status'] == STATUS_QUEUED_UNASSIGNED): ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submissions.queuedUnassigned"), $this);?>

				<?php elseif ($this->_tpl_vars['status'] == STATUS_QUEUED_EDITING): ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submissions.queuedEditing"), $this);?>

				<?php elseif ($this->_tpl_vars['status'] == STATUS_QUEUED_REVIEW): ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submissions.queuedReview"), $this);?>

				<?php elseif ($this->_tpl_vars['status'] == STATUS_PUBLISHED): ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submissions.published"), $this);?>
&nbsp;&nbsp;&nbsp;&nbsp;<?php echo ((is_array($_tmp=$this->_tpl_vars['issue']->getIssueIdentification())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

				<?php elseif ($this->_tpl_vars['status'] == STATUS_DECLINED): ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submissions.declined"), $this);?>

				<?php endif; ?>
			</div>
			<div class="col-md-4">

				<?php if ($this->_tpl_vars['status'] != STATUS_ARCHIVED): ?>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'unsuitableSubmission','articleId' => $this->_tpl_vars['submission']->getId()), $this);?>
" class="btn btn-danger btn-sm"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.archiveSubmission"), $this);?>
</a>
				<?php else: ?>
				<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'restoreToQueue','path' => $this->_tpl_vars['submission']->getId()), $this);?>
" class="btn btn-primary btn-sm"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.restoreToQueue"), $this);?>
</a>
				<?php endif; ?>
				
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<strong>
					<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.initiated"), $this);?>

				</strong>
			</div>
			<div class="col-md-6"> 
				<?php echo ((is_array($_tmp=$this->_tpl_vars['submission']->getDateStatusModified())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['dateFormatShort']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['dateFormatShort'])); ?>

			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<strong>
					<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.lastModified"), $this);?>

				</strong>
			</div>
			<div class="col-md-6"> 
				<?php echo ((is_array($_tmp=$this->_tpl_vars['submission']->getLastModified())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['dateFormatShort']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['dateFormatShort'])); ?>

			</div>
		</div>
		<?php if ($this->_tpl_vars['enableComments']): ?>
		
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "comments.readerComments"), $this);?>


		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['submission']->getCommentsStatusString()), $this);?>


		<form action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'updateCommentsStatus','path' => $this->_tpl_vars['submission']->getId()), $this);?>
" method="post"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.changeComments"), $this);?>
 <select name="commentsStatus" size="1" class="selectMenu"><?php echo $this->_plugins['function']['html_options_translate'][0][0]->smartyHtmlOptionsTranslate(array('options' => $this->_tpl_vars['commentsStatusOptions'],'selected' => $this->_tpl_vars['submission']->getCommentsStatus()), $this);?>
</select> <input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.record"), $this);?>
" class="button" /></form><

		<?php endif; ?>


	</div>
