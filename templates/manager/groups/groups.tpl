{**
 * templates/manager/groups/groups.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of groups in journal management.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.groups"}
{assign var="pageId" value="manager.groups"}
{include file="common/header.tpl"}
{/strip}

<script type="text/javascript">
{literal}
$(document).ready(function() { setupTableDND("#dragTable", "moveGroup"); });
{/literal}
</script>

<br/>

<form action="{url op="setBoardEnabled"}" method="post" class="form-horizontal">
	{url|assign:"aboutEditorialTeamUrl" page="about" op="editorialTeam"}
	{url|assign:"peopleManagementUrl" page="manager" op="people" path="all"}
	{translate key="manager.groups.enableBoard.description" aboutEditorialTeamUrl=$aboutEditorialTeamUrl}<br/>
	<div class="form-group">
	<div class="col-md-12">
	<label for="boardEnabledOff">
	<input type="radio" id="boardEnabledOff" {if !$boardEnabled}checked="checked" {/if}name="boardEnabled" value="0"/>&nbsp;{translate key="manager.groups.disableBoard"}</label>
	</div>
	</div>
	<div class="form-group">
	<div class="col-md-12">
	<label for="boardEnabledOn">
	<input type="radio" id="boardEnabledOn" {if $boardEnabled}checked="checked" {/if}name="boardEnabled" value="1"/>&nbsp;{translate key="manager.groups.enableBoard"}</label>
	</div>
	</div>	
	<input type="submit" value="{translate key="common.record"}" class="btn btn-primary"/>
</form>

<br />

<div id="groups">
<a href="{url op="createGroup"}" class="btn btn-success pull-right">{translate key="manager.groups.create"}</a>
<table width="100%" class="table tbale-striped" id="dragTable">
	<thead>
	<tr class="heading" valign="bottom">
		<th colspan="2" width="75%">{translate key="manager.groups.title"}</th>
		<th width="25%">{translate key="common.action"}</th>
	</tr>
	</thead>
	<tbody>
{assign var="isFirstEditorialTeamEntry" value=1}
{iterate from=groups item=group}
	{if $group->getContext() == GROUP_CONTEXT_EDITORIAL_TEAM}
		{if $isFirstEditorialTeamEntry}
			{assign var="isFirstEditorialTeamEntry" value=0}
				<tr valign="top">
					<td colspan="3">{translate key="manager.groups.context.editorialTeam.short"}</td>
				</tr>
			
			{/if}
		<tr valign="top" id=editorialteam-{$group->getId()} class="data">
			<td class="drag" width="5%">&nbsp;</td>
			<td class="drag">
				{url|assign:"url" page="manager" op="email" toGroup=$group->getId()}
				{$group->getLocalizedTitle()|escape}&nbsp;{icon name="mail" url=$url}
			</td>
		{else}
		<tr valign="top" id="other-{$group->getId()}" class="data">
			<td class="drag" colspan="2">
				{url|assign:"url" page="manager" op="email" toGroup=$group->getId()}
				{$group->getLocalizedTitle()|escape}&nbsp;{icon name="mail" url=$url}
			</td>
		{/if}
		<td>
			<a href="{url op="editGroup" path=$group->getId()}" class="action">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="groupMembership" path=$group->getId()}" class="action">{translate key="manager.groups.membership"}</a>&nbsp;|&nbsp;<a href="{url op="deleteGroup" path=$group->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.groups.confirmDelete"}')" class="action">{translate key="common.delete"}</a>&nbsp;|&nbsp;<a href="{url op="moveGroup" d=u id=$group->getId()}">&uarr;</a>&nbsp;<a href="{url op="moveGroup" d=d id=$group->getId()}">&darr;</a>
		</td>
	</tr>

{/iterate}
{if $groups->wasEmpty()}
	<tr>
		<td colspan="3" class="nodata">{translate key="manager.groups.noneCreated"}</td>
	</tr>
	
{else}
	<tr>
		<td colspan="2" align="left">{page_info iterator=$groups}</td>
		<td colspan="1" align="right">{page_links anchor="groups" name="groups" iterator=$groups}</td>
	</tr>
{/if}
</tbody>
</table>


</div>

{include file="common/footer.tpl"}

