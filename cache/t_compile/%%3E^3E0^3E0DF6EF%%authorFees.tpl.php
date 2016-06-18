<?php /* Smarty version 2.6.26, created on 2016-06-18 20:44:04
         compiled from sectionEditor/submission/authorFees.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'sectionEditor/submission/authorFees.tpl', 12, false),array('function', 'url', 'sectionEditor/submission/authorFees.tpl', 21, false),array('modifier', 'escape', 'sectionEditor/submission/authorFees.tpl', 16, false),array('modifier', 'date_format', 'sectionEditor/submission/authorFees.tpl', 19, false),)), $this); ?>
<div id="authorFees">
<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.payment.authorFees"), $this);?>
</h3>
<table width="100%" class="data">
<?php if ($this->_tpl_vars['currentJournal']->getSetting('submissionFeeEnabled')): ?>
	<tr>
		<td width="20%"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('submissionFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</td>
		<td width="80%">
	<?php if ($this->_tpl_vars['submissionPayment']): ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paid"), $this);?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['submissionPayment']->getTimestamp())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['datetimeFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['datetimeFormatLong'])); ?>

	<?php else: ?> 
		<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waiveSubmissionFee','path' => $this->_tpl_vars['submission']->getId(),'markAsPaid' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paymentReceived"), $this);?>
</a>&nbsp;|&nbsp;<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waiveSubmissionFee','path' => $this->_tpl_vars['submission']->getId()), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.waive"), $this);?>
</a>
	<?php endif; ?>
		</td>
	</tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['currentJournal']->getSetting('fastTrackFeeEnabled')): ?>
	<tr>
		<td width="20%"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('fastTrackFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</td>
		<td width="80%"> 
	<?php if ($this->_tpl_vars['fastTrackPayment']): ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paid"), $this);?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['fastTrackPayment']->getTimestamp())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['datetimeFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['datetimeFormatLong'])); ?>

	<?php else: ?>
		<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waiveFastTrackFee','path' => $this->_tpl_vars['submission']->getId(),'markAsPaid' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paymentReceived"), $this);?>
</a>&nbsp;|&nbsp;<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waiveFastTrackFee','path' => $this->_tpl_vars['submission']->getId()), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.waive"), $this);?>
</a>		
	<?php endif; ?>
		</td>
	</tr>	
<?php endif; ?>
<?php if ($this->_tpl_vars['currentJournal']->getSetting('publicationFeeEnabled')): ?>
	<tr>
		<td width="20%"><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('publicationFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</td>
		<td width="80%">
	<?php if ($this->_tpl_vars['publicationPayment']): ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paid"), $this);?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['publicationPayment']->getTimestamp())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['datetimeFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['datetimeFormatLong'])); ?>

	<?php else: ?>
		<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waivePublicationFee','path' => $this->_tpl_vars['submission']->getId(),'markAsPaid' => true), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paymentReceived"), $this);?>
</a>&nbsp;|&nbsp;<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'waivePublicationFee','path' => $this->_tpl_vars['submission']->getId()), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.waive"), $this);?>
</a>		
	<?php endif; ?>
		</td>
	</tr>
<?php endif; ?>
</table>
</div>