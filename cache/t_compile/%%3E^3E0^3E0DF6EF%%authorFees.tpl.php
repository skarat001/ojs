<?php /* Smarty version 2.6.26, created on 2016-06-19 16:01:42
         compiled from sectionEditor/submission/authorFees.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'sectionEditor/submission/authorFees.tpl', 12, false),array('function', 'url', 'sectionEditor/submission/authorFees.tpl', 27, false),array('modifier', 'escape', 'sectionEditor/submission/authorFees.tpl', 18, false),array('modifier', 'date_format', 'sectionEditor/submission/authorFees.tpl', 25, false),)), $this); ?>
<div id="authorFees">
<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.payment.authorFees"), $this);?>
</h3>

<?php if ($this->_tpl_vars['currentJournal']->getSetting('submissionFeeEnabled')): ?>
		<div class="row">
			<div class="col-md-3">
				<strong> 
<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('submissionFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

				</strong>
			</div>
			<div class="col-md-6"> 

	<?php if ($this->_tpl_vars['submissionPayment']): ?>

		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paid"), $this);?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['submissionPayment']->getTimestamp())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['datetimeFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['datetimeFormatLong'])); ?>

	<?php else: ?> 
		<a  href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waiveSubmissionFee','path' => $this->_tpl_vars['submission']->getId(),'markAsPaid' => true), $this);?>
" class="btn btn-success btn-xs mgn"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paymentReceived"), $this);?>
</a>&nbsp;|&nbsp;<a  href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waiveSubmissionFee','path' => $this->_tpl_vars['submission']->getId()), $this);?>
" class="btn btn-warning btn-xs mgn"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.waive"), $this);?>
</a>
	<?php endif; ?>
	</div>
		</div>
<?php endif; ?>
<?php if ($this->_tpl_vars['currentJournal']->getSetting('fastTrackFeeEnabled')): ?>
			<div class="row">
			<div class="col-md-3">
				<strong>
	<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('fastTrackFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

				</strong>
			</div>
			<div class="col-md-6"> 
	<?php if ($this->_tpl_vars['fastTrackPayment']): ?>

		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paid"), $this);?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['fastTrackPayment']->getTimestamp())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['datetimeFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['datetimeFormatLong'])); ?>


	<?php else: ?>

		<a class="btn btn-success btn-xs mgn" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waiveFastTrackFee','path' => $this->_tpl_vars['submission']->getId(),'markAsPaid' => true), $this);?>
" ><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paymentReceived"), $this);?>
</a>&nbsp;|&nbsp;<a class="btn btn-warning btn-xs mgn" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waiveFastTrackFee','path' => $this->_tpl_vars['submission']->getId()), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.waive"), $this);?>
</a>		
	<?php endif; ?>
			</div>
		</div>	
<?php endif; ?>
<?php if ($this->_tpl_vars['currentJournal']->getSetting('publicationFeeEnabled')): ?>
			<div class="row">
			<div class="col-md-3">
				<strong>
	<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('publicationFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

				</strong>
			</div>
			<div class="col-md-6"> 
	<?php if ($this->_tpl_vars['publicationPayment']): ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paid"), $this);?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['publicationPayment']->getTimestamp())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['datetimeFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['datetimeFormatLong'])); ?>

	<?php else: ?>
		<a class="btn btn-success btn-xs mgn" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waivePublicationFee','path' => $this->_tpl_vars['submission']->getId(),'markAsPaid' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paymentReceived"), $this);?>
</a>&nbsp;|&nbsp;<a class="btn btn-warning btn-xs mgn" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waivePublicationFee','path' => $this->_tpl_vars['submission']->getId()), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.waive"), $this);?>
</a>		
	<?php endif; ?>
			</div>
		</div>
<?php endif; ?>

</div>