{**
	* plugins/blocks/user/block.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Common site sidebar menu -- user tools.
	*
	*}
	<div class="panel panel-default" id="sidebarUser">

		<div class="panel-heading">
			{if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
			<span class="blockTitle"> <i class="fa fa-user fa-1x" ></i> {translate key="navigation.user"}</span>
			{/if}
		</div>
		<div class="panel-body user-menu">
			{if $isUserLoggedIn}
			{translate key="plugins.block.user.loggedInAs"}<br />
			<strong>{$loggedInUsername|escape}</strong>
			<br>
			{if $hasOtherJournals}
			<a href="{url journal="index" page="user"}" class="btn btn-primary btn-block ">{translate key="plugins.block.user.myJournals"}</a>
			{/if}
			<a href="{url page="user" op="profile"} " class="btn btn-primary btn-block">{translate key="plugins.block.user.myProfile"}</a>
			<a href="{url page="user" op="changePassword"}" class="btn btn-primary btn-block">{translate key="user.changeMyPassword"}</a>
			<a href="{url page="login" op="signOut"}"  class="btn btn-primary btn-block">{translate key="plugins.block.user.logout"}</a>
			{if $userSession->getSessionVar('signedInAs')}
			<a href="{url page="login" op="signOutAsUser"}" class="btn btn-primary btn-block">{translate key="plugins.block.user.signOutAsUser"}</a>
			{/if}

			{else}
			{if $implicitAuth}
			{if $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
			<span class="blockTitle">{translate key="user.login.implicitAuth"}</span>
			{/if}
			<a href="{url page="login" op="implicitAuthLogin"}">{translate key="plugins.block.user.implicitAuthLogin"}</a>
			{if $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
			<span class="blockTitle">{translate key="user.login.localAuth"}</span>
			{/if}
			{/if}
			{if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
			{if $userBlockLoginSSL}
			<a href="{$userBlockLoginUrl}">{translate key="user.login"}</a>
			{else}
			<form method="post" action="{$userBlockLoginUrl}" >
				<div class="form-group">

					<input type="text" id="sidebar-username" placeholder='{translate key="user.username"}'  name="username" value="" size="12" maxlength="32" class="form-control" />
				</div>
				<div class="form-group">

					<input type="password" id="sidebar-password" placeholder='{translate key="user.password"}' name="password" value="{$password|escape}" size="12" class="form-control" />
				</div>

				<div class="checkbox">
				 <label for="remember">
					<input type="checkbox" id="remember" name="remember" value="1" />{translate key="plugins.block.user.rememberMe"}</label>
				</div>

				<input type="submit" value="{translate key="user.login"}" class="btn btn-default" /></td>


			</form>
			{/if}
			{/if}
			{/if}
		</div>
	</div>