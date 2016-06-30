{**
 * templates/admin/auth/sources.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of authentication sources in site administration.
 *
 *}
{strip}
{assign var="pageTitle" value="admin.authSources"}
{include file="common/header.tpl"}
{/strip}

<br />

<form method="post" action="{url op="updateAuthSources"}">

<div id="sources">
<table width="100%" class="table table-striped">
<thead>
	<tr valign="top" class="heading">
		<th width="10%">{translate key="common.default"}</th>
		<th width="30%">{translate key="common.title"}</th>
		<th width="30%">{translate key="common.plugin"}</th>
		<th width="30%" align="right">{translate key="common.action"}</th>
	</tr>
</thead>
<tbody>
	{iterate from=sources item=auth}
	<tr valign="top">
		<td><input type="radio" id="defaultAuthId_{$auth->getAuthId()}" name="defaultAuthId" value="{$auth->getAuthId()}"{if $auth->getDefault()} checked="checked"{assign var="defaultAuthId" value=$auth->getAuthId()}{/if} /></td>
		<td><label for="defaultAuthId_{$auth->getAuthId()}">{$auth->getTitle()|escape}</label></td>
		<td>{$auth->getPlugin()}</td>
		<td align="right"><a href="{url op="editAuthSource" path=$auth->getAuthId()}" class="btn btn-warning">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a class="btn btn-danger" href="{url op="deleteAuthSource" path=$auth->getAuthId()}" onclick="return confirm('{translate|escape:"jsparam" key="admin.auth.confirmDelete"}')">{translate key="common.delete"}</a></td>
	</tr>

	{/iterate}
	{if $sources->wasEmpty()}
	<tr>
		<td colspan="4" class="nodata">{translate key="admin.auth.noneCreated"}</td>
	</tr>

	{else}
		<tr>
			<td colspan="2" align="left">{page_info iterator=$sources}</td>
			<td colspan="2" align="right">{page_links anchor="sources" name="sources" iterator=$sources}</td>
		</tr>
	{/if}
	<tr valign="top">
		<td><input type="radio" id="defaultAuthId_0" name="defaultAuthId" value="0"{if !$defaultAuthId} checked="checked"{/if} /></td>
		<td colspan="1"><label for="defaultAuthId_0">{translate key="admin.auth.ojs"}</label></td>
		<td colspan="2" align="right">
			<input type="submit" value="{translate key="common.save"}" class="btn btn-primary" />
		</td>
	</tr>
	</tbody>
</table>

</form>

{translate key="admin.auth.defaultSourceDescription"}
<div id="createAuth">
<h4>{translate key="admin.auth.create"}</h4>

<form method="post" action="{url op="createAuthSource"} class="form-horizontal" ">
	{translate key="common.plugin"}: <select name="plugin" size="1"><option value=""></option>{html_options options=$pluginOptions}</select> <input type="submit" value="{translate key="common.create"}" class="btn btn-primary" />
</form>
</div>
</div>
{include file="common/footer.tpl"}

