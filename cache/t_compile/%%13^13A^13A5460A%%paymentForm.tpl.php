<?php /* Smarty version 2.6.26, created on 2016-06-18 20:42:18
         compiled from file:C:%5Cxampp%5Chtdocs%5Cojs2%5Cojs/plugins/paymethod/manual/templates%5CpaymentForm.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/paymethod/manual/templates\\paymentForm.tpl', 18, false),array('function', 'url', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/paymethod/manual/templates\\paymentForm.tpl', 35, false),array('modifier', 'escape', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/paymethod/manual/templates\\paymentForm.tpl', 19, false),array('modifier', 'string_format', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/paymethod/manual/templates\\paymentForm.tpl', 24, false),array('modifier', 'nl2br', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/paymethod/manual/templates\\paymentForm.tpl', 29, false),array('modifier', 'to_array', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/paymethod/manual/templates\\paymentForm.tpl', 35, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "plugins.paymethod.manual"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


<div id="paymentForm">
<table class="data" width="100%">
	<tr>
		<td class="label" width="20%"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.paymethod.manual.purchase.title"), $this);?>
</td>
		<td class="value" width="80%"><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['itemName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</strong></td>
	</tr>
	<?php if ($this->_tpl_vars['itemAmount']): ?>
		<tr>
			<td class="label" width="20%"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.paymethod.manual.purchase.fee"), $this);?>
</td>
			<td class="value" width="80%"><strong><?php echo ((is_array($_tmp=$this->_tpl_vars['itemAmount'])) ? $this->_run_mod_handler('string_format', true, $_tmp, "%.2f") : smarty_modifier_string_format($_tmp, "%.2f")); ?>
<?php if ($this->_tpl_vars['itemCurrencyCode']): ?> (<?php echo ((is_array($_tmp=$this->_tpl_vars['itemCurrencyCode'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
)<?php endif; ?></strong></td>
		</tr>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['itemDescription']): ?>
	<tr>
		<td colspan="2"><?php echo ((is_array($_tmp=$this->_tpl_vars['itemDescription'])) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</td>
	</tr>
	<?php endif; ?>
</table>
<p><?php echo ((is_array($_tmp=$this->_tpl_vars['manualInstructions'])) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</p>

<p><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'payment','op' => 'plugin','path' => ((is_array($_tmp=((is_array($_tmp='ManualPayment')) ? $this->_run_mod_handler('to_array', true, $_tmp, 'notify', $this->_tpl_vars['queuedPaymentId']) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp, 'notify', $this->_tpl_vars['queuedPaymentId'])))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))), $this);?>
" class="action"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.paymethod.manual.sendNotificationOfPayment"), $this);?>
</a>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>