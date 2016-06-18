<?php /* Smarty version 2.6.26, created on 2016-06-18 21:23:04
         compiled from author/submission/authorFees.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'author/submission/authorFees.tpl', 12, false),array('function', 'url', 'author/submission/authorFees.tpl', 31, false),array('modifier', 'escape', 'author/submission/authorFees.tpl', 20, false),array('modifier', 'date_format', 'author/submission/authorFees.tpl', 27, false),array('modifier', 'string_format', 'author/submission/authorFees.tpl', 30, false),)), $this); ?>
	<div id="authorFees">
		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.authorFees"), $this);?>
</h3>
	<div class="row" >

			<div class="col-md-3 ">
				<h5>

		<?php if ($this->_tpl_vars['currentJournal']->getSetting('submissionFeeEnabled')): ?>

		<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('submissionFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		<?php if ($this->_tpl_vars['submissionPayment']): ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paid"), $this);?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['submissionPayment']->getTimestamp())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['datetimeFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['datetimeFormatLong'])); ?>

		<?php else: ?>
		
		<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getSetting('submissionFee'))) ? $this->_run_mod_handler('string_format', true, $_tmp, "%.2f") : smarty_modifier_string_format($_tmp, "%.2f")); ?>
 <?php echo $this->_tpl_vars['currentJournal']->getSetting('currency'); ?>
<
		<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'paySubmissionFee','path' => $this->_tpl_vars['submission']->getId()), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.payNow"), $this);?>
</a>
		<?php endif; ?>
				</strong>
				</h5>
			</div>
		</div>

		<?php endif; ?>

			<div class="row" >

			<div class="col-md-3 ">
				<h5>
		<?php if ($this->_tpl_vars['currentJournal']->getSetting('fastTrackFeeEnabled')): ?>

		<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('fastTrackFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
:
			</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong> 
		<?php if ($this->_tpl_vars['fastTrackPayment']): ?>
			
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paid"), $this);?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['fastTrackPayment']->getTimestamp())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['datetimeFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['datetimeFormatLong'])); ?>

		<?php else: ?>
		<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getSetting('fastTrackFee'))) ? $this->_run_mod_handler('string_format', true, $_tmp, "%.2f") : smarty_modifier_string_format($_tmp, "%.2f")); ?>
 <?php echo $this->_tpl_vars['currentJournal']->getSetting('currency'); ?>

		<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'payFastTrackFee','path' => $this->_tpl_vars['submission']->getId()), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.payNow"), $this);?>
</a>
		<?php endif; ?>

		<?php endif; ?>
						</strong>
				</h5>
			</div>
		</div>

			<div class="row" >

			<div class="col-md-3 ">
				<h5>
		<?php if ($this->_tpl_vars['currentJournal']->getSetting('publicationFeeEnabled')): ?>

		<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('publicationFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>

				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
					
		<?php if ($this->_tpl_vars['publicationPayment']): ?>
		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.paid"), $this);?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['publicationPayment']->getTimestamp())) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['datetimeFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['datetimeFormatLong'])); ?>


		<?php else: ?>
		<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getSetting('publicationFee'))) ? $this->_run_mod_handler('string_format', true, $_tmp, "%.2f") : smarty_modifier_string_format($_tmp, "%.2f")); ?>
 <?php echo $this->_tpl_vars['currentJournal']->getSetting('currency'); ?>

		<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'payPublicationFee','path' => $this->_tpl_vars['submission']->getId()), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "payment.payNow"), $this);?>
</a>
		<?php endif; ?>

		<?php endif; ?>
				</strong>
				</h5>
			</div>
		</div>
	</div>