<?php /* Smarty version 2.6.26, created on 2016-06-18 21:41:31
         compiled from submission/metadata/metadata.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'submission/metadata/metadata.tpl', 11, false),array('function', 'url', 'submission/metadata/metadata.tpl', 14, false),array('function', 'call_hook', 'submission/metadata/metadata.tpl', 15, false),array('function', 'icon', 'submission/metadata/metadata.tpl', 36, false),array('modifier', 'concat', 'submission/metadata/metadata.tpl', 34, false),array('modifier', 'to_array', 'submission/metadata/metadata.tpl', 35, false),array('modifier', 'strip_tags', 'submission/metadata/metadata.tpl', 35, false),array('modifier', 'assign', 'submission/metadata/metadata.tpl', 35, false),array('modifier', 'escape', 'submission/metadata/metadata.tpl', 36, false),array('modifier', 'nl2br', 'submission/metadata/metadata.tpl', 66, false),array('modifier', 'default', 'submission/metadata/metadata.tpl', 66, false),array('modifier', 'strip_unsafe_html', 'submission/metadata/metadata.tpl', 90, false),)), $this); ?>
<div id="metadata">
<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.metadata"), $this);?>
</h3>

<?php if ($this->_tpl_vars['canEditMetadata']): ?>
	<p><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'viewMetadata','path' => $this->_tpl_vars['submission']->getId()), $this);?>
" class="btn btn-warning"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.editMetadata"), $this);?>
</a></p>
	<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Submission::Metadata::Metadata::AdditionalEditItems"), $this);?>

<?php endif; ?>

<div id="authors">

<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.authors"), $this);?>
</h4>
	

	<?php $_from = $this->_tpl_vars['submission']->getAuthors(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['authors'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['authors']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['author']):
        $this->_foreach['authors']['iteration']++;
?>
	<div class="row" >

			<div class="col-md-3 ">
				<h5>
	<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.name"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
			<?php $this->assign('emailString', ((is_array($_tmp=$this->_tpl_vars['author']->getFullName())) ? $this->_run_mod_handler('concat', true, $_tmp, " <", $this->_tpl_vars['author']->getEmail(), ">") : $this->_plugins['modifier']['concat'][0][0]->smartyConcat($_tmp, " <", $this->_tpl_vars['author']->getEmail(), ">"))); ?>
			<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'email','redirectUrl' => $this->_tpl_vars['currentUrl'],'to' => ((is_array($_tmp=$this->_tpl_vars['emailString'])) ? $this->_run_mod_handler('to_array', true, $_tmp) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp)),'subject' => ((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedTitle())) ? $this->_run_mod_handler('strip_tags', true, $_tmp) : smarty_modifier_strip_tags($_tmp)),'articleId' => $this->_tpl_vars['submission']->getId()), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'url') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'url'));?>

			<?php echo ((is_array($_tmp=$this->_tpl_vars['author']->getFullName())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
 <?php echo $this->_plugins['function']['icon'][0][0]->smartyIcon(array('name' => 'mail','url' => $this->_tpl_vars['url']), $this);?>

		
	<?php if ($this->_tpl_vars['author']->getData('orcid')): ?>
		
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.orcid"), $this);?>


		<a href="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']->getData('orcid'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" target="_blank"><?php echo ((is_array($_tmp=$this->_tpl_vars['author']->getData('orcid'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>
<br/>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['author']->getUrl()): ?>
		
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.url"), $this);?>


		<a href="<?php echo ((is_array($_tmp=$this->_tpl_vars['author']->getUrl())) ? $this->_run_mod_handler('escape', true, $_tmp, 'quotes') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'quotes')); ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['author']->getUrl())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a>
<br/>
	<?php endif; ?>
		</strong>
				</h5>
			</div>
</div>
<div class="row" >

			<div class="col-md-3 ">
				<h5>
	<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.affiliation"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['author']->getLocalizedAffiliation())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>
</td>
		</strong>
				</h5>
			</div>

</div>
<div class="row" >

			<div class="col-md-3 ">
				<h5>
	<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.country"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['author']->getCountryLocalized())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>



	<?php if ($this->_tpl_vars['currentJournal']->getSetting('requireAuthorCompetingInterests')): ?>
		
				<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'information','op' => 'competingInterestGuidelines'), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'competingInterestGuidelinesUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'competingInterestGuidelinesUrl'));?>

				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.competingInterests",'competingInterestGuidelinesUrl' => $this->_tpl_vars['competingInterestGuidelinesUrl']), $this);?>

			
			<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['author']->getLocalizedCompetingInterests())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : String::stripUnsafeHtml($_tmp)))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>


	<?php endif; ?>
			</strong>
				</h5>
			</div>

</div>

<div class="row" >

			<div class="col-md-3 ">
				<h5>
	<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.biography"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['author']->getLocalizedBiography())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : String::stripUnsafeHtml($_tmp)))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>

<div class="row" >

			<div class="col-md-5 ">
				<h5>
	<?php if ($this->_tpl_vars['author']->getPrimaryContact()): ?>
		
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "author.submit.selectPrincipalContact"), $this);?>


	<?php endif; ?>

	<?php if (! ($this->_foreach['authors']['iteration'] == $this->_foreach['authors']['total'])): ?>
		

	<?php endif; ?>
	</h5>
			</div>
			</div>
	<?php endforeach; endif; unset($_from); ?>


</div>

<div id="titleAndAbstract">
<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.titleAndAbstract"), $this);?>
</h4>
<div class="row" >

			<div class="col-md-3 ">
				<h5>

		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.title"), $this);?>

		</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedTitle())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : String::stripUnsafeHtml($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>
<div class="row" >

			<div class="col-md-3 ">
				<h5>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.abstract"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedAbstract())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : String::stripUnsafeHtml($_tmp)))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>
</div>

<div id="indexing">
<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.indexing"), $this);?>
</h4>
	

	<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaDiscipline')): ?>
		<div class="row" >

			<div class="col-md-3 ">
				<h5>

		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.discipline"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedDiscipline())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaSubjectClass')): ?>
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.subjectClassification"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedSubjectClass())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>


		</strong>
				</h5>
			</div>

</div>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaSubject')): ?>
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.subject"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedSubject())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>

	<?php endif; ?>
	<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaCoverage')): ?>
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.coverageGeo"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedCoverageGeo())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedCoverageChron())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>
<div class="row" >

			<div class="col-md-3 ">
				<h5>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.coverageSample"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedCoverageSample())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaType')): ?>
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.type"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedType())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>
	<?php endif; ?>
	<div class="row" >

			<div class="col-md-3 ">
				<h5>
	<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "article.language"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLanguage())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>
</div>

<div id="supportingAgencies">
<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.supportingAgencies"), $this);?>
</h4>
	
<div class="row" >

			<div class="col-md-3 ">
				<h5>
<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.agencies"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getLocalizedSponsor())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>
</div>

<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Submission::Metadata::Metadata::AdditionalMetadata"), $this);?>


<?php if ($this->_tpl_vars['currentJournal']->getSetting('metaCitations')): ?>
	<div id="citations">
	<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.citations"), $this);?>
</h4>

	<div class="row" >

			<div class="col-md-3 ">
				<h5>
	<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "submission.citations"), $this);?>

</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['submission']->getCitations())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : String::stripUnsafeHtml($_tmp)))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>

		</strong>
				</h5>
			</div>

</div>
	</div>
<?php endif; ?>

</div><!-- metadata -->
