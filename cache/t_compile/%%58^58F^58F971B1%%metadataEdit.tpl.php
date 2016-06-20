<?php /* Smarty version 2.6.26, created on 2016-06-19 05:49:38
         compiled from submission/metadata/metadataEdit.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'submission/metadata/metadataEdit.tpl', 15, false),array('function', 'fieldLabel', 'submission/metadata/metadataEdit.tpl', 40, false),array('function', 'form_language_chooser', 'submission/metadata/metadataEdit.tpl', 66, false),array('function', 'translate', 'submission/metadata/metadataEdit.tpl', 67, false),array('function', 'html_options', 'submission/metadata/metadataEdit.tpl', 171, false),array('function', 'call_hook', 'submission/metadata/metadataEdit.tpl', 195, false),array('modifier', 'assign', 'submission/metadata/metadataEdit.tpl', 15, false),array('modifier', 'escape', 'submission/metadata/metadataEdit.tpl', 18, false),array('modifier', 'to_array', 'submission/metadata/metadataEdit.tpl', 370, false),)), $this); ?>
	<?php echo ''; ?><?php $this->assign('pageTitle', "submission.editMetadata"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


	<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'information','op' => 'competingInterestGuidelines'), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'competingInterestGuidelinesUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'competingInterestGuidelinesUrl'));?>


	<form id="metadata" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'saveMetadata'), $this);?>
" enctype="multipart/form-data" class="form-horizontal">
		<input type="hidden" name="articleId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['articleId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/formErrors.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

		<?php if ($this->_tpl_vars['canViewAuthors']): ?>
		<?php echo '
		<script type="text/javascript">
			<!--
// Move author up/down
function moveAuthor(dir, authorIndex) {
	var form = document.getElementById(\'metadata\');
	form.moveAuthor.value = 1;
	form.moveAuthorDir.value = dir;
	form.moveAuthorIndex.value = authorIndex;
	form.submit();
}
// -->
</script>
'; ?>


<?php if (count ( $this->_tpl_vars['formLocales'] ) > 1): ?>
<div id="locales">

	<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'formLocale','key' => "form.formLanguage"), $this);?>


	<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('path' => $this->_tpl_vars['articleId'],'escape' => false), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'formUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'formUrl'));?>

		<?php $_from = $this->_tpl_vars['authors']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['authorIndex'] => $this->_tpl_vars['author']):
?>
	<?php if ($this->_tpl_vars['currentJournal']->getSetting('requireAuthorCompetingInterests')): ?>
	<?php $_from = $this->_tpl_vars['author']['competingInterests']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['thisLocale'] => $this->_tpl_vars['thisCompetingInterests']):
?>
	<?php if ($this->_tpl_vars['thisLocale'] != $this->_tpl_vars['formLocale']): ?>

	<input type="hidden" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][competingInterests][<?php echo ((is_array($_tmp=$this->_tpl_vars['thisLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['thisCompetingInterests'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" /><?php endif; ?>
	<?php endforeach; endif; unset($_from); ?>
	<?php endif; ?>
	<?php $_from = $this->_tpl_vars['author']['biography']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['thisLocale'] => $this->_tpl_vars['thisBiography']):
?>
	<?php if ($this->_tpl_vars['thisLocale'] != $this->_tpl_vars['formLocale']): ?>

	<input type="hidden" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][biography][<?php echo ((is_array($_tmp=$this->_tpl_vars['thisLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['thisBiography'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" /><?php endif; ?>

	<?php endforeach; endif; unset($_from); ?>
	<?php $_from = $this->_tpl_vars['author']['affiliation']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['thisLocale'] => $this->_tpl_vars['thisAffiliation']):
?>
	<?php if ($this->_tpl_vars['thisLocale'] != $this->_tpl_vars['formLocale']): ?>

	<input type="hidden" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][affiliation][<?php echo ((is_array($_tmp=$this->_tpl_vars['thisLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['thisAffiliation'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />

	<?php endif; ?>
	<?php endforeach; endif; unset($_from); ?>
	<?php endforeach; endif; unset($_from); ?>
	<?php echo $this->_plugins['function']['form_language_chooser'][0][0]->smartyFormLanguageChooser(array('form' => 'metadata','url' => $this->_tpl_vars['formUrl']), $this);?>

	<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "form.formLanguage.description"), $this);?>
</span>


</locales>
<?php endif; ?>

<div id="authors">

	<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.authors"), $this);?>
</h3>

	<input type="hidden" name="deletedAuthors" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['deletedAuthors'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
	<input type="hidden" name="moveAuthor" value="0" />
	<input type="hidden" name="moveAuthorDir" value="" />
	<input type="hidden" name="moveAuthorIndex" value="" />


	<?php $_from = $this->_tpl_vars['authors']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['authors'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['authors']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['authorIndex'] => $this->_tpl_vars['author']):
        $this->_foreach['authors']['iteration']++;
?>


	<input type="hidden" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][authorId]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['authorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />

	<input type="hidden" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][seq]" value="<?php echo $this->_tpl_vars['authorIndex']+1; ?>
" />

	<?php if ($this->_foreach['authors']['total'] <= 1): ?>

	<input type="hidden" name="primaryContact" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
	<?php endif; ?>

	<div class="form-group">
		<label class="col-md-3 control-label">

			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-firstName",'required' => 'true','key' => "user.firstName"), $this);?>

		</label>
		<div class="col-md-6">

			<input type="text" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][firstName]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-firstName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['firstName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="40" class="form-control" />

		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-middleName",'key' => "user.middleName"), $this);?>

		</label>
		<div class="col-md-6">
			<input type="text" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][middleName]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-middleName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['middleName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="40" class="form-control" />
		</div>
	</div>


	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-lastName",'required' => 'true','key' => "user.lastName"), $this);?>

		</label>
		<div class="col-md-6">
			<input type="text" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][lastName]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-lastName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['lastName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="90" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-email",'required' => 'true','key' => "user.email"), $this);?>

		</label>
		<div class="col-md-6">
			<input type="text" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][email]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-email" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['email'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="90" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-orcid",'key' => "user.orcid"), $this);?>

		</label>
		<div class="col-md-6">
			<input type="text" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][orcid]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-orcid" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['orcid'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="90" class="form-control" /><br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.orcid.description"), $this);?>

		</div>
	</div>


	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-url",'key' => "user.url"), $this);?>

		</label>
		<div class="col-md-6">
			<input type="text" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][url]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-url" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['url'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="255" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-affiliation",'key' => "user.affiliation"), $this);?>

		</label>
		<div class="col-md-6">
			<textarea name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][affiliation][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" class="form-control" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-affiliation" rows="5" cols="40"><?php echo ((is_array($_tmp=$this->_tpl_vars['author']['affiliation'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea><br/>
			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.affiliation.description"), $this);?>
</span>
		</div>
	</div>

	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-country",'key' => "common.country"), $this);?>

		</label>
		<div class="col-md-6">
			<select name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][country]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-country" class="selectMenu">
				<option value=""></option>
				<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['countries'],'selected' => ((is_array($_tmp=$this->_tpl_vars['author']['country'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))), $this);?>

			</select>
		</div>
	</div>

	<?php if ($this->_tpl_vars['currentJournal']->getSetting('requireAuthorCompetingInterests')): ?>
	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-competingInterests",'key' => "author.competingInterests",'competingInterestGuidelinesUrl' => $this->_tpl_vars['competingInterestGuidelinesUrl']), $this);?>

		</label>
		<div class="col-md-6">
			<textarea name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][competingInterests][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" class="form-control" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-competingInterests" rows="5" cols="40"><?php echo ((is_array($_tmp=$this->_tpl_vars['author']['competingInterests'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
		</div>
	</div>
	<?php endif; ?>
	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-biography",'key' => "user.biography"), $this);?>
<br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.biography.description"), $this);?>

		</label>
		<div class="col-md-6">
			<textarea name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][biography][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-biography" rows="5" cols="40" class="form-control"><?php echo ((is_array($_tmp=$this->_tpl_vars['author']['biography'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
		</div>
	</div>
	<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Submission::MetadataEdit::Authors"), $this);?>


	<?php if ($this->_foreach['authors']['total'] > 1): ?>
	<div class="form-group">
		<label class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.reorder"), $this);?>

		</label>
		<div class="col-md-6">
			<a href="javascript:moveAuthor('u', '<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
')" class="action plain">&uarr;</a> <a href="javascript:moveAuthor('d', '<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
')" class="action plain">&darr;</a>

			<label for="primaryContact-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
">
				<input type="radio" name="primaryContact" id="primaryContact-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"<?php if ($this->_tpl_vars['primaryContact'] == $this->_tpl_vars['authorIndex']): ?> checked="checked"<?php endif; ?> /> <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.selectPrincipalContact"), $this);?>
</label>
			</div>
		</div>

		<div class="form-group ">
			<div class="col-md-6 col-md-offset-3">
				<input type="submit" name="delAuthor[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.deleteAuthor"), $this);?>
" class="btn btn-default" />
			</div>
		</div>
		<?php endif; ?>
		<?php if (! ($this->_foreach['authors']['iteration'] == $this->_foreach['authors']['total'])): ?>

		<?php endif; ?>

		<?php endforeach; else: ?>
		<input type="hidden" name="authors[0][authorId]" value="0" />
		<input type="hidden" name="primaryContact" value="0" />
		<input type="hidden" name="authors[0][seq]" value="1" />

		<div class="form-group">
			<label class="col-md-3 control-label">
				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-firstName",'required' => 'true','key' => "user.firstName"), $this);?>

			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][firstName]" id="authors-0-firstName" size="20" maxlength="40" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-middleName",'key' => "user.middleName"), $this);?>

			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][middleName]" id="authors-0-middleName" size="20" maxlength="40" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-lastName",'required' => 'true','key' => "user.lastName"), $this);?>

			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][lastName]" id="authors-0-lastName" size="20" maxlength="90" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-email",'required' => 'true','key' => "user.email"), $this);?>

			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][email]" id="authors-0-email" size="30" maxlength="90" class="form-control" />
			</div>
		</div>


		<div class="form-group">
			<label class="col-md-3 control-label">
				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-url",'key' => "user.url"), $this);?>

			</label>
			<div class="col-md-6">
				<input type="text" name="authors[0][url]" id="authors-0-url" size="30" maxlength="255" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-affiliation",'key' => "user.affiliation"), $this);?>

			</label>
			<div class="col-md-6">
				<textarea name="authors[0][affiliation][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" class="form-control" id="authors-0-affiliation" rows="5" cols="40"></textarea><br/>
				<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.affiliation.description"), $this);?>
</span>
			</div>
		</div>


		<div class="form-group">
			<label class="col-md-3 control-label">
				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-country",'key' => "common.country"), $this);?>

			</label>
			<div class="col-md-6">
				<select name="authors[0][country]" id="authors-0-country" class="selectMenu">
					<option value=""></option>
					<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['countries']), $this);?>

				</select>
			</div>
		</div>

		<?php if ($this->_tpl_vars['currentJournal']->getSetting('requireAuthorCompetingInterests')): ?>

		<div class="form-group">
			<label class="col-md-3 control-label">
				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-competingInterests",'key' => "author.competingInterests",'competingInterestGuidelinesUrl' => $this->_tpl_vars['competingInterestGuidelinesUrl']), $this);?>

			</label>
			<div class="col-md-6">
				<textarea name="authors[0][competingInterests][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" class="form-control" id="authors-0-competingInterests" rows="5" cols="40"></textarea>
			</div>
		</div>
		<?php endif; ?>

		<div class="form-group">
			<label class="col-md-3 control-label">
				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-biography",'key' => "user.biography"), $this);?>
<br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.biography.description"), $this);?>

			</label>
			<div class="col-md-6">
				<textarea name="authors[0][biography][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="authors-0-biography" rows="5" cols="40" class="form-control"></textarea>
			</div>
		</div>
		<?php endif; unset($_from); ?>

		<div class="form-group ">
			<div class="col-md-6 col-md-offset-3">
				<p><input type="submit" class="btn btn-default" name="addAuthor" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.addAuthor"), $this);?>
" /></p>
			</div>
		</div>
	</div>

	<div class="separator"></div>
	<?php endif; ?>

	<div id="titleAndAbstract">
		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.titleAndAbstract"), $this);?>
</h3>
	<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'title','required' => 'true','key' => "article.title"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="title[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="title" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['title'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="60" class="form-control" />
			</div>
		</div>

	<div class="form-group">
			<label class="col-md-3 control-label">
		<?php if ($this->_tpl_vars['section'] && $this->_tpl_vars['section']->getAbstractsNotRequired() == 0): ?><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'abstract','required' => 'true','key' => "article.abstract"), $this);?>
<?php else: ?><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'abstract','key' => "article.abstract"), $this);?>
<?php endif; ?>
			</label>
			<div class="col-md-6">
		<textarea name="abstract[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="abstract" rows="15" cols="60" class="form-control"><?php echo ((is_array($_tmp=$this->_tpl_vars['abstract'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<div id="cover">
		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.cover"), $this);?>
</h3>

		<input type="hidden" name="fileName[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['fileName'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
		<input type="hidden" name="originalFileName[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['originalFileName'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />


	<div class="form-group">
			<div class="col-md-6 checkbox">
			 <label for="showCoverPage">
		<input type="checkbox" name="showCoverPage[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="showCoverPage" value="1" <?php if ($this->_tpl_vars['showCoverPage'][$this->_tpl_vars['formLocale']]): ?> checked="checked"<?php endif; ?> /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.showCoverPage"), $this);?>
</label>

			</div>
		</div>

			<div class="form-group">
			<label class="col-md-3 control-label">

		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'coverPage','key' => "editor.article.coverPage"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="file" name="coverPage" id="coverPage" class="form-control" />&nbsp;&nbsp;<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "form.saveToUpload"), $this);?>
<br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.coverPageInstructions"), $this);?>
<br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.uploaded"), $this);?>
:&nbsp;<?php if ($this->_tpl_vars['fileName'][$this->_tpl_vars['formLocale']]): ?><a href="javascript:openWindow('<?php echo $this->_tpl_vars['publicFilesDir']; ?>
/<?php echo ((is_array($_tmp=$this->_tpl_vars['fileName'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'url')); ?>
');" class="file"><?php echo $this->_tpl_vars['originalFileName'][$this->_tpl_vars['formLocale']]; ?>
</a>&nbsp;<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'removeArticleCoverPage','path' => ((is_array($_tmp=$this->_tpl_vars['articleId'])) ? $this->_run_mod_handler('to_array', true, $_tmp, $this->_tpl_vars['formLocale']) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp, $this->_tpl_vars['formLocale']))), $this);?>
" onclick="return confirm('<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.removeCoverPage"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp, 'jsparam') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'jsparam'));?>
')"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.remove"), $this);?>
</a><?php else: ?>&mdash;<?php endif; ?>
			</div>
		</div>


			<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'coverPageAltText','key' => "common.altText"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="coverPageAltText[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['coverPageAltText'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="form-control" />

		<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.altTextInstructions"), $this);?>
</span>
			</div>
		</div>


			<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'hideCoverPageToc','key' => "editor.article.coverPageDisplay"), $this);?>

			</label>
			<div class="col-md-6 checkbox">
			<label for="hideCoverPageToc">
		<input type="checkbox" name="hideCoverPageToc[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="hideCoverPageToc" value="1" <?php if ($this->_tpl_vars['hideCoverPageToc'][$this->_tpl_vars['formLocale']]): ?> checked="checked"<?php endif; ?> /> <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.hideCoverPageToc"), $this);?>
</label>
<label for="hideCoverPageAbstract">
		<input type="checkbox" name="hideCoverPageAbstract[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="hideCoverPageAbstract" value="1" <?php if ($this->_tpl_vars['hideCoverPageAbstract'][$this->_tpl_vars['formLocale']]): ?> checked="checked"<?php endif; ?> /> <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.hideCoverPageAbstract"), $this);?>
</label>
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<div id="indexing">
		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.indexing"), $this);?>
</h3>

		<?php if ($this->_tpl_vars['journalSettings']['metaDiscipline'] || $this->_tpl_vars['journalSettings']['metaSubjectClass'] || $this->_tpl_vars['journalSettings']['metaSubject'] || $this->_tpl_vars['journalSettings']['metaCoverage'] || $this->_tpl_vars['journalSettings']['metaType']): ?><p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.submissionIndexingDescription"), $this);?>
</p><?php endif; ?>


		<?php if ($this->_tpl_vars['journalSettings']['metaDiscipline']): ?>
		
			<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'discipline','key' => "article.discipline"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="discipline[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="discipline" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['discipline'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="form-control" />
		<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaDisciplineExamples') != ''): ?>
		<br />
		<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaDisciplineExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>
					</div>
		</div>
		<?php endif; ?>

		<?php endif; ?>
		<?php if ($this->_tpl_vars['journalSettings']['metaSubjectClass']): ?>
		
		<a href="<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaSubjectClassUrl'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" target="_blank"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaSubjectClassTitle'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>

	<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'subjectClass','key' => "article.subjectClassification"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="subjectClass[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="subjectClass" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['subjectClass'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="form-control" />
		<br />
		<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.subjectClassInstructions"), $this);?>
</span>
					</div>
		</div>
		<?php endif; ?>
		<?php if ($this->_tpl_vars['journalSettings']['metaSubject']): ?>
		

			<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'subject','key' => "article.subject"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="subject[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="subject" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['subject'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="form-control" />
		<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaSubjectExamples') != ''): ?>
		<br />
		<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaSubjectExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>
		<?php endif; ?>
			</div>
		</div>

		<?php endif; ?>
		<?php if ($this->_tpl_vars['journalSettings']['metaCoverage']): ?>
		
			<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'coverageGeo','key' => "article.coverageGeo"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="coverageGeo[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="coverageGeo" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['coverageGeo'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="form-control" />
		<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageGeoExamples') != ''): ?>
		<br />
		<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageGeoExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>
		<?php endif; ?>
			</div>
		</div>


	<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'coverageChron','key' => "article.coverageChron"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="coverageChron[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="coverageChron" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['coverageChron'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="form-control" />
		<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageChronExamples') != ''): ?>
		<br />
		<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageChronExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>
		<?php endif; ?>
					</div>
		</div>


	<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'coverageSample','key' => "article.coverageSample"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="coverageSample[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="coverageSample" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['coverageSample'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="form-control" />
		<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageResearchSampleExamples') != ''): ?>
		<br />
		<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageResearchSampleExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>
		<?php endif; ?>
			</div>
		</div>

		<?php endif; ?>
		<?php if ($this->_tpl_vars['journalSettings']['metaType']): ?>
		

			<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'type','key' => "article.type"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="type[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="type" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['type'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="form-control" />
			</div>
		</div>

		<?php endif; ?>
		
			<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'language','key' => "article.language"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="language" id="language" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['language'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="5" maxlength="10" class="form-control" />
		<br />
		<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.languageInstructions"), $this);?>
</span>
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<div id="supportingAgencies">

		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.supportingAgencies"), $this);?>
</h3>

		<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.submissionSupportingAgenciesDescription"), $this);?>
</p>

	<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'sponsor','key' => "submission.agencies"), $this);?>

			</label>
			<div class="col-md-6">
		<input type="text" name="sponsor[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="sponsor" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsor'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="60" maxlength="255" class="form-control" />

			</div>
		</div>
	</div>

	<div class="separator"></div>

	<?php $_from = $this->_tpl_vars['pubIdPlugins']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['pubIdPlugin']):
?>
	<?php $this->assign('pubIdMetadataFile', $this->_tpl_vars['pubIdPlugin']->getPubIdMetadataFile()); ?>
	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['pubIdMetadataFile']), 'smarty_include_vars' => array('pubObject' => $this->_tpl_vars['article'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
	<?php endforeach; endif; unset($_from); ?>

	<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Submission::MetadataEdit::AdditionalMetadata"), $this);?>


	<?php if ($this->_tpl_vars['journalSettings']['metaCitations']): ?>
	<div id="metaCitations">
		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.citations"), $this);?>
</h3>

		<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.submissionCitations"), $this);?>
</p>

	<div class="form-group">
			<label class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'citations','key' => "submission.citations"), $this);?>

					</label>
			<div class="col-md-6">
		<textarea name="citations" id="citations" class="form-control" rows="15" cols="60"><?php echo ((is_array($_tmp=$this->_tpl_vars['citations'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	// Display warning when citations are being changed.
	$(function() {
		$('#citations').change(function(e) {
			var $this = $(this);
			var originalContent = $this.text();
			var newContent = $this.val();
			if(originalContent != newContent) {
				// Display confirm message.
			if (!confirm('<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.citations.metadata.changeWarning"), $this);?>
')) {
				$this.val(originalContent);
			}
			}
			});
		});
</script>
<div class="separator"></div>
<?php endif; ?>

<?php if ($this->_tpl_vars['isEditor']): ?>
<div id="display">
	<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.display"), $this);?>
</h3>

	<div class="form-group">
			<label class="col-md-3 control-label">	
	<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'hideAuthor','key' => "issue.toc"), $this);?>

			</label>
			<div class="col-md-6">
	<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "editor.article.hideTocAuthorDescription"), $this);?>
:
				<select name="hideAuthor" id="hideAuthor" class="selectMenu">
					<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['hideAuthorOptions'],'selected' => ((is_array($_tmp=$this->_tpl_vars['hideAuthor'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))), $this);?>

				</select>
						</div>
		</div>
</div>

<div id="permissions">
	<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.permissions"), $this);?>
</h3>
		<div class="form-group">
			<label class="col-md-3 control-label">
	<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'copyrightHolder','key' => "submission.copyrightHolder"), $this);?>

			</label>
			<div class="col-md-6">
	<input type="text" name="copyrightHolder[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="copyrightHolder" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['copyrightHolder'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="60" maxlength="255" class="form-control" />
			</div>
		</div>


	<div class="form-group">
			<label class="col-md-3 control-label">
	<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'copyrightYear','key' => "submission.copyrightYear"), $this);?>

			</label>
			<div class="col-md-6">
	<input type="text" name="copyrightYear" id="copyrightYear" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['copyrightYear'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="10" maxlength="255" class="form-control" />
			</div>
		</div>

			<div class="form-group">
			<label class="col-md-3 control-label">
	<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'licenseURL','key' => "submission.licenseURL"), $this);?>
<
			</label>
			<div class="col-md-6">
	<input type="text" name="licenseURL" id="licenseURL" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['licenseURL'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="60" maxlength="255" class="form-control" />
			</div>
		</div>
</div>

<div class="separator"></div>

<?php endif; ?>
<div class="form-group ">
<div class="col-md-6 col-md-offset-3">
<p><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.saveMetadata"), $this);?>
" class="btn btn-primary"/> <input type="button" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.cancel"), $this);?>
" class="btn btn-default" onclick="history.go(-1)" /></p>
			</div>
		</div>
<p><span class="formRequired"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.requiredField"), $this);?>
</span></p>

</form>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
