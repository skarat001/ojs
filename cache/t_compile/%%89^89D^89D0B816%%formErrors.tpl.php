<?php /* Smarty version 2.6.26, created on 2016-06-17 06:10:30
         compiled from common/formErrors.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'common/formErrors.tpl', 14, false),array('modifier', 'escape', 'common/formErrors.tpl', 17, false),)), $this); ?>
<?php if ($this->_tpl_vars['isError']): ?>

	<div  class="alert alert-danger">
		<p>
		<span ><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "form.errorsOccurred"), $this);?>
:</span>
		<ul class="list-unstyled">
		<?php $_from = $this->_tpl_vars['errors']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['field'] => $this->_tpl_vars['message']):
?>
			<li><a href="#<?php echo ((is_array($_tmp=$this->_tpl_vars['field'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"><?php echo $this->_tpl_vars['message']; ?>
</a></li>
		<?php endforeach; endif; unset($_from); ?>
	
	</div>
	<script type="text/javascript"><?php echo '
		<!--
		// Jump to form errors.
		window.location.hash="formErrors";
		// -->
	'; ?>
</script>
<?php endif; ?>