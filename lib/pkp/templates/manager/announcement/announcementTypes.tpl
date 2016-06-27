{**
 * announcementTypes.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of announcement types in management.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.announcementTypes"}
{assign var="pageId" value="manager.announcementTypes"}
{include file="common/header.tpl"}
{/strip}

<ul class="nav nav-pills">
	<li class="nav-item "><a href="{url op="announcements"}" class="nav-link">{translate key="manager.announcements"}</a></li>
	
	<li class="nav-item active"><a href="{url op="announcementTypes" }" class="nav-link">{translate key="manager.announcementTypes"}</a></li>

</ul>
<hr>

<br />

<div id="announcementTypes">
<a href="{url op="createAnnouncementType"}" class="btn btn-success pull-right">{translate key="manager.announcementTypes.create"}</a>
<table width="100%" class="table table-striped">
	<thead>
	<tr class="heading" valign="bottom">
		<td width="75%">{translate key="manager.announcementTypes.typeName"}</td>
		<td width="25xa%">{translate key="common.action"}</td>
	</tr>
	</thead>
	<tbody>
{iterate from=announcementTypes item=announcementType}

	<tr valign="top">
		<td>{$announcementType->getLocalizedTypeName()|escape}</td>
		<td><a href="{url op="editAnnouncementType" path=$announcementType->getId()}" class="btn btn-warning btn-xs">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="deleteAnnouncementType" path=$announcementType->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.announcementTypes.confirmDelete"}')" class="btn btn-danger btn-xs">{translate key="common.delete"}</a></td>
	</tr>


{/iterate}
{if $announcementTypes->wasEmpty()}
	<tr>
		<td colspan="2" class="nodata">{translate key="manager.announcementTypes.noneCreated"}</td>
	</tr>
	

{else}
	<tr>
		<td align="left">{page_info iterator=$announcementTypes}</td>
		<td align="right">{page_links anchor="announcementTypes" name="announcementTypes" iterator=$announcementTypes}</td>
	</tr>
{/if}
</tbody>
</table>


</div>

{include file="common/footer.tpl"}

