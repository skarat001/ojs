<?php /* Smarty version 2.6.26, created on 2016-06-17 09:10:08
         compiled from author/submit/step3.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'author/submit/step3.tpl', 14, false),array('function', 'fieldLabel', 'author/submit/step3.tpl', 40, false),array('function', 'form_language_chooser', 'author/submit/step3.tpl', 60, false),array('function', 'translate', 'author/submit/step3.tpl', 61, false),array('function', 'html_options', 'author/submit/step3.tpl', 152, false),array('function', 'call_hook', 'author/submit/step3.tpl', 176, false),array('modifier', 'assign', 'author/submit/step3.tpl', 14, false),array('modifier', 'escape', 'author/submit/step3.tpl', 19, false),)), $this); ?>
	<?php $this->assign('pageTitle', "author.submit.step3"); ?>
	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "author/submit/submitHeader.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

	<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'information','op' => 'competingInterestGuidelines'), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'competingInterestGuidelinesUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'competingInterestGuidelinesUrl'));?>


	<div class="separator"></div>

	<form id="submit" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'saveSubmit','path' => $this->_tpl_vars['submitStep']), $this);?>
" class="form-horizontal">
		<input type="hidden" name="articleId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['articleId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/formErrors.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

		<?php echo '
		<script type="text/javascript">
			<!--
// Move author up/down
function moveAuthor(dir, authorIndex) {
	var form = document.getElementById(\'submit\');
	form.moveAuthor.value = 1;
	form.moveAuthorDir.value = dir;
	form.moveAuthorIndex.value = authorIndex;
	form.submit();
}
// -->
</script>
'; ?>


<?php if (count ( $this->_tpl_vars['formLocales'] ) > 1): ?>
<div id="locales" class="form-group">
	<div class="col-md-3 control-label" >
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'formLocale','key' => "form.formLanguage"), $this);?>
123123
	</div>
	<div class="col-md-6" >
		<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'submit','path' => '3','articleId' => $this->_tpl_vars['articleId'],'escape' => false), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'submitFormUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'submitFormUrl'));?>

				<?php $_from = $this->_tpl_vars['authors']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['authorIndex'] => $this->_tpl_vars['author']):
?>
		<?php if ($this->_tpl_vars['currentJournal']->getSetting('requireAuthorCompetingInterests')): ?>
		<?php $_from = $this->_tpl_vars['author']['competingInterests']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['thisLocale'] => $this->_tpl_vars['thisCompetingInterests']):
?>
		<?php if ($this->_tpl_vars['thisLocale'] != $this->_tpl_vars['formLocale']): ?><input type="hidden" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][competingInterests][<?php echo ((is_array($_tmp=$this->_tpl_vars['thisLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['thisCompetingInterests'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" /><?php endif; ?>
		<?php endforeach; endif; unset($_from); ?>
		<?php endif; ?>
		<?php $_from = $this->_tpl_vars['author']['biography']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['thisLocale'] => $this->_tpl_vars['thisBiography']):
?>
		<?php if ($this->_tpl_vars['thisLocale'] != $this->_tpl_vars['formLocale']): ?><input type="hidden" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][biography][<?php echo ((is_array($_tmp=$this->_tpl_vars['thisLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['thisBiography'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" /><?php endif; ?>
		<?php endforeach; endif; unset($_from); ?>
		<?php $_from = $this->_tpl_vars['author']['affiliation']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['thisLocale'] => $this->_tpl_vars['thisAffiliation']):
?>
		<?php if ($this->_tpl_vars['thisLocale'] != $this->_tpl_vars['formLocale']): ?><input type="hidden" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][affiliation][<?php echo ((is_array($_tmp=$this->_tpl_vars['thisLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['thisAffiliation'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" /><?php endif; ?>
		<?php endforeach; endif; unset($_from); ?>
		<?php endforeach; endif; unset($_from); ?>
	</div>
</div>
<?php echo $this->_plugins['function']['form_language_chooser'][0][0]->smartyFormLanguageChooser(array('form' => 'submit','url' => $this->_tpl_vars['submitFormUrl']), $this);?>

<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "form.formLanguage.description"), $this);?>
</span>


</div>
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
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-firstName",'required' => 'true','key' => "user.firstName"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][firstName]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-firstName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['firstName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="40" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-middleName",'key' => "user.middleName"), $this);?>
</td>
		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][middleName]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-middleName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['middleName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="40" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-lastName",'required' => 'true','key' => "user.lastName"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][lastName]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-lastName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['lastName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="90" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-email",'required' => 'true','key' => "user.email"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][email]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-email" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['email'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="90" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-orcid",'key' => "user.orcid"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][orcid]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-orcid" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['orcid'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="90" /><br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.orcid.description"), $this);?>

		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">		
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-url",'key' => "user.url"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="text" name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][url]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-url" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['url'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="255" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-affiliation",'key' => "user.affiliation"), $this);?>

		</div>
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
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-country",'key' => "common.country"), $this);?>

		</div>
		<div class="col-md-6">
			<select name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][country]" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-country" class="form-control">
				<option value=""></option>
				<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['countries'],'selected' => $this->_tpl_vars['author']['country']), $this);?>

			</select>
		</div>
	</div>

	<?php if ($this->_tpl_vars['currentJournal']->getSetting('requireAuthorCompetingInterests')): ?>
	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-competingInterests",'key' => "author.competingInterests",'competingInterestGuidelinesUrl' => $this->_tpl_vars['competingInterestGuidelinesUrl']), $this);?>
</td>
		</div>
		<div class="col-md-6">
			<textarea name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][competingInterests][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" class="form-control" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-competingInterests" rows="5" cols="40"><?php echo ((is_array($_tmp=$this->_tpl_vars['author']['competingInterests'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
		</div>
	</div>

	<?php endif; ?>	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-".($this->_tpl_vars['authorIndex'])."-biography",'key' => "user.biography"), $this);?>
<br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.biography.description"), $this);?>

		</div>
		<div class="col-md-6">
			<textarea name="authors[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][biography][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" class="form-control" id="authors-<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-biography" rows="5" cols="40"><?php echo ((is_array($_tmp=$this->_tpl_vars['author']['biography'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
		</div>
	</div>
	<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Author::Submit::Authors"), $this);?>


	<?php if ($this->_foreach['authors']['total'] > 1): ?>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<a href="javascript:moveAuthor('u', '<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
')" class="action">&uarr;</a> <a href="javascript:moveAuthor('d', '<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
')" class="action">&darr;</a>
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.reorderInstructions"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="radio" name="primaryContact" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"<?php if ($this->_tpl_vars['primaryContact'] == $this->_tpl_vars['authorIndex']): ?> checked="checked"<?php endif; ?> /> <label for="primaryContact"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.selectPrincipalContact"), $this);?>
</label> <input type="submit" name="delAuthor[<?php echo ((is_array($_tmp=$this->_tpl_vars['authorIndex'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.deleteAuthor"), $this);?>
" class="button" />
		</div>
	</div>
	<?php endif; ?>


	<?php endforeach; else: ?>
	<input type="hidden" name="authors[0][authorId]" value="0" />
	<input type="hidden" name="primaryContact" value="0" />
	<input type="hidden" name="authors[0][seq]" value="1" />

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-firstName",'required' => 'true','key' => "user.firstName"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[0][firstName]" id="authors-0-firstName" size="20" maxlength="40" /></td>
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-middleName",'key' => "user.middleName"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[0][middleName]" id="authors-0-middleName" size="20" maxlength="40" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-lastName",'required' => 'true','key' => "user.lastName"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[0][lastName]" id="authors-0-lastName" size="20" maxlength="90" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-email",'required' => 'true','key' => "user.email"), $this);?>

		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[0][email]" id="authors-0-email" size="30" maxlength="90" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-orcid",'key' => "user.orcid"), $this);?>
</td>
		</div>
		<div class="col-md-6">
			<input type="text" class="form-control" name="authors[0][orcid]" id="authors-0-orcid" size="30" maxlength="90" /><br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.orcid.description"), $this);?>

		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-url",'key' => "\"user.url
		</div>
		<div class=\"col-md-6\">
			<input type=\"text\" class=\"form-control\" name=\"authors[0][url]\" id=\"authors-0-url\" size=\"30\" maxlength=\"255\" />
		</div>
	</div>

	<div class=\"form-group\">
		<div class=\"col-md-3"), $this);?>

		</div>
		<div class="col-md-6">
			<textarea name="authors[0][affiliation][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" class="form-control" id="authors-0-affiliation" rows="5" cols="40"></textarea><br/>
			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.affiliation.description"), $this);?>
</span>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-country",'key' => "common.country"), $this);?>

		</div>
		<div class="col-md-6">
			<select name="authors[0][country]" id="authors-0-country" class="form-control">
				<option value=""></option>
				<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['countries']), $this);?>

			</select>
		</div>
	</div>

	<?php if ($this->_tpl_vars['currentJournal']->getSetting('requireAuthorCompetingInterests')): ?>
	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-competingInterests",'key' => "author.competingInterests",'competingInterestGuidelinesUrl' => $this->_tpl_vars['competingInterestGuidelinesUrl']), $this);?>
</td>
		</div>
		<div class="col-md-6">
			<textarea name="authors[0][competingInterests][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" class="form-control" id="authors-0-competingInterests" rows="5" cols="40"></textarea>
		</div>
	</div>
	<?php endif; ?>
	<div class="form-group">
		<div class="col-md-3 control-label">
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "authors-0-biography",'key' => "user.biography"), $this);?>
<br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.biography.description"), $this);?>

		</div>
		<div class="col-md-6">
			<textarea name="authors[0][biography][<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" class="form-control" id="authors-0-biography" rows="5" cols="40"></textarea>
		</div>
	</div>
	<?php endif; unset($_from); ?>

	<div class="form-group ">
		<div class="col-md-6 col-md-offset-3">
			<p><input type="submit" class="button" name="addAuthor" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.addAuthor"), $this);?>
" /></p>
		</div>
	</div>

	<div id="titleAndAbstract">

		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.titleAndAbstract"), $this);?>
</h3>
		<div class="form-group">
			<div class="col-md-3 control-label">

				<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'title','required' => 'true','key' => "article.title"), $this);?>

			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" name="title[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="title" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['title'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="60" />
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				<?php if ($this->_tpl_vars['section']->getAbstractsNotRequired() == 0): ?><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'abstract','key' => "article.abstract",'required' => 'true'), $this);?>
<?php else: ?><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'abstract','key' => "article.abstract"), $this);?>
<?php endif; ?>
			</div>
			<div class="col-md-6">
				<textarea name="abstract[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="abstract" class="form-control" rows="15" cols="60"><?php echo ((is_array($_tmp=$this->_tpl_vars['abstract'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
			</div>
		</div>

	</div>

	<div class="separator"></div>

	<?php if ($this->_tpl_vars['section']->getMetaIndexed() == 1): ?>
	<div id="indexing">
		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.indexing"), $this);?>
</h3>
		<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaDiscipline') || $this->_tpl_vars['currentJournal']->getSetting('metaSubjectClass') || $this->_tpl_vars['currentJournal']->getSetting('metaSubject') || $this->_tpl_vars['currentJournal']->getSetting('metaCoverage') || $this->_tpl_vars['currentJournal']->getSetting('metaType')): ?><p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.submissionIndexingDescription"), $this);?>
</p><?php endif; ?>

		<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaDiscipline')): ?>
	<div class="form-group">
			<div class="col-md-3 control-label">
<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'discipline','key' => "article.discipline"), $this);?>

</div>
			<div class="col-md-6">
		<input type="text" class="form-control" name="discipline[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="discipline" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['discipline'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" />
	</div>
		</div>


<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaDisciplineExamples')): ?>
	
		<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaDisciplineExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>



		<?php endif; ?>


		<?php endif; ?>

		<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaSubjectClass')): ?>
			<div class="form-group">
			<div class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'subjectClass','key' => "article.subjectClassification"), $this);?>

		</div>
			<div class="col-md-6">
		<input type="text" class="form-control" name="subjectClass[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="subjectClass" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['subjectClass'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" />
	</div>
		</div>

		<a href="<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaSubjectClassUrl'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" target="_blank"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaSubjectClassTitle'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>

		<?php endif; ?>

		<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaSubject')): ?>
	<div class="form-group">
			<div class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'subject','key' => "article.subject"), $this);?>

</div>
			<div class="col-md-6">
		<input type="text" class="form-control" name="subject[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="subject" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['subject'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" />
	</div>
		</div>

		<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaSubjectExamples') != ''): ?>

		<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaSubjectExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>

		<?php endif; ?>


		<?php endif; ?>

		<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaCoverage')): ?>
	<div class="form-group">
			<div class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'coverageGeo','key' => "article.coverageGeo"), $this);?>

</div>
			<div class="col-md-6">
		<input type="text" class="form-control" name="coverageGeo[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="coverageGeo" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['coverageGeo'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" />

	</div>
		</div>
		<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageGeoExamples')): ?>

		<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageGeoExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>

		<?php endif; ?>

	<div class="form-group">
			<div class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'coverageChron','key' => "article.coverageChron"), $this);?>

</div>
			<div class="col-md-6">
		<input type="text" class="form-control" name="coverageChron[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="coverageChron" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['coverageChron'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" />

	</div>
		</div>
		<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageChronExamples') != ''): ?>

		<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageChronExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>

		<?php endif; ?>
	<div class="form-group">
			<div class="col-md-3 control-label">
		<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'coverageSample','key' => "article.coverageSample"), $this);?>

</div>
			<div class="col-md-6">
		<input type="text" class="form-control" name="coverageSample[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="coverageSample" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['coverageSample'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" />
	</div>
		</div>
	<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageResearchSampleExamples') != ''): ?>
	
	<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaCoverageResearchSampleExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>

	<?php endif; ?>
	

	<?php endif; ?>

	<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaType')): ?>
	
		<div class="form-group">
			<div class="col-md-3 control-label">
	<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'type','key' => "article.type"), $this);?>

</div>
			<div class="col-md-6">
	<input type="text" class="form-control" name="type[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="type" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['type'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" />
	</div>
		</div>

	<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('metaTypeExamples') != ''): ?>
	
	<span class="instruct"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('metaTypeExamples'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</span>

	<?php endif; ?>
	

	<?php endif; ?>

		<div class="form-group">
			<div class="col-md-3 control-label">
	<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'language','key' => "article.language"), $this);?>

</div>
			<div class="col-md-6">
	<input type="text" class="form-control" name="language" id="language" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['language'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="5" maxlength="10" />
	</div>
		</div>
	<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.languageInstructions"), $this);?>
</span>

</div>
<div class="separator"></div>
<?php endif; ?>

<div id="submissionSupportingAgencies">
	<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.submissionSupportingAgencies"), $this);?>
</h3>
	<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.submissionSupportingAgenciesDescription"), $this);?>
</p>


	<div class="form-group">
			<div class="col-md-3 control-label">
	<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'sponsor','key' => "submission.agencies"), $this);?>

		</div>
					<div class="col-md-6">
	<input type="text" class="form-control" name="sponsor[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="sponsor" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsor'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="60" maxlength="255" />
	</div>
		</div>

</div>
<div class="separator"></div>

<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Author::Submit::AdditionalMetadata"), $this);?>


<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaCitations')): ?>
<div id="metaCitations">
	<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.citations"), $this);?>
</h3>

	<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.submissionCitations"), $this);?>
</p>

		<div class="form-group">
			<div class="col-md-3 control-label">
	<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'citations','key' => "submission.citations"), $this);?>

</div>
			<div class="col-md-6">
	<textarea name="citations" id="citations" class="form-control" rows="15" cols="60"><?php echo ((is_array($_tmp=$this->_tpl_vars['citations'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
	</div>
		</div>
	<div class="separator"></div>
</div>
<?php endif; ?>

<div class="form-group ">
<div class="col-md-5 col-md-offset-3">
<p><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.saveAndContinue"), $this);?>
" class="btn btn-primary" /> <input type="button" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.cancel"), $this);?>
" class="btn btn-default" onclick="confirmAction('<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'author'), $this);?>
', '<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.cancelSubmission"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp, 'jsparam') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'jsparam'));?>
')" /></p>
</div>
</div>

<p><span class="formRequired"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.requiredField"), $this);?>
</span></p>

</form>

<?php if ($this->_tpl_vars['scrollToAuthor']): ?>
<?php echo '
<script type="text/javascript">
	var authors = document.getElementById(\'authors\');
	authors.scrollIntoView(false);
</script>
'; ?>

<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
