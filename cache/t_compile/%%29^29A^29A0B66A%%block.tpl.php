<?php /* Smarty version 2.6.26, created on 2016-06-17 21:32:11
         compiled from file:C:%5Cxampp%5Chtdocs%5Cojs2%5Cojs/plugins/blocks/user/block.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/blocks/user/block.tpl', 15, false),array('function', 'url', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/blocks/user/block.tpl', 24, false),array('modifier', 'escape', 'file:C:\\xampp\\htdocs\\ojs2\\ojs/plugins/blocks/user/block.tpl', 21, false),)), $this); ?>
	<div class="panel panel-default" id="sidebarUser">

		<div class="panel-heading">
			<?php if (! $this->_tpl_vars['implicitAuth'] || $this->_tpl_vars['implicitAuth'] === @IMPLICIT_AUTH_OPTIONAL): ?>
			<span class="blockTitle"> <i class="fa fa-user fa-1x" ></i> <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.user"), $this);?>
</span>
			<?php endif; ?>
		</div>
		<div class="panel-body user-menu">
			<?php if ($this->_tpl_vars['isUserLoggedIn']): ?>
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.user.loggedInAs"), $this);?>
<br />
			<strong><?php echo ((is_array($_tmp=$this->_tpl_vars['loggedInUsername'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</strong>
			<br>
			<?php if ($this->_tpl_vars['hasOtherJournals']): ?>
			<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => 'index','page' => 'user'), $this);?>
" class="btn btn-primary btn-block "><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.user.myJournals"), $this);?>
</a>
			<?php endif; ?>
			<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'profile'), $this);?>
 " class="btn btn-primary btn-block"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.user.myProfile"), $this);?>
</a>
			<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'changePassword'), $this);?>
" class="btn btn-primary btn-block"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.changeMyPassword"), $this);?>
</a>
			<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login','op' => 'signOut'), $this);?>
"  class="btn btn-primary btn-block"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.user.logout"), $this);?>
</a>
			<?php if ($this->_tpl_vars['userSession']->getSessionVar('signedInAs')): ?>
			<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login','op' => 'signOutAsUser'), $this);?>
" class="btn btn-primary btn-block"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.user.signOutAsUser"), $this);?>
</a>
			<?php endif; ?>

			<?php else: ?>
			<?php if ($this->_tpl_vars['implicitAuth']): ?>
			<?php if ($this->_tpl_vars['implicitAuth'] === @IMPLICIT_AUTH_OPTIONAL): ?>
			<span class="blockTitle"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.login.implicitAuth"), $this);?>
</span>
			<?php endif; ?>
			<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login','op' => 'implicitAuthLogin'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.user.implicitAuthLogin"), $this);?>
</a>
			<?php if ($this->_tpl_vars['implicitAuth'] === @IMPLICIT_AUTH_OPTIONAL): ?>
			<span class="blockTitle"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.login.localAuth"), $this);?>
</span>
			<?php endif; ?>
			<?php endif; ?>
			<?php if (! $this->_tpl_vars['implicitAuth'] || $this->_tpl_vars['implicitAuth'] === @IMPLICIT_AUTH_OPTIONAL): ?>
			<?php if ($this->_tpl_vars['userBlockLoginSSL']): ?>
			<a href="<?php echo $this->_tpl_vars['userBlockLoginUrl']; ?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.login"), $this);?>
</a>
			<?php else: ?>
			<form method="post" action="<?php echo $this->_tpl_vars['userBlockLoginUrl']; ?>
" >
				<div class="form-group">

					<input type="text" id="sidebar-username" placeholder='<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.username"), $this);?>
'  name="username" value="" size="12" maxlength="32" class="form-control" />
				</div>
				<div class="form-group">

					<input type="password" id="sidebar-password" placeholder='<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.password"), $this);?>
' name="password" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['password'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="12" class="form-control" />
				</div>

				<div class="checkbox">
				 <label for="remember">
					<input type="checkbox" id="remember" name="remember" value="1" /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.user.rememberMe"), $this);?>
</label>
				</div>

				<input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.login"), $this);?>
" class="btn btn-default" /></td>


			</form>
			<?php endif; ?>
			<?php endif; ?>
			<?php endif; ?>
		</div>
	</div>