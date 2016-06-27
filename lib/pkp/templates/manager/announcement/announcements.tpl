{**
 * lib/pkp/templates/announcement/announcements.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of announcements in management.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.announcements"}
{assign var="pageId" value="manager.announcements"}
{include file="common/header.tpl"}
{/strip}
<ul class="nav nav-pills">
	<li class="nav-item active"><a href="{url op="announcements"}" class="nav-link">{translate key="manager.announcements"}</a></li>
	
	<li class="nav-item"><a href="{url op="announcementTypes" }" class="nav-link">{translate key="manager.announcementTypes"}</a></li>

</ul>
<hr>


<div id="announcementList">
<a href="{url op="createAnnouncement"}" class="btn btn-success pull-right">{translate key="manager.announcements.create"}</a>
<table width="100%" class="table table-striped">
<thead>
	<tr class="heading" valign="bottom">
		<th width="20%">{translate key="manager.announcements.dateExpire"}</th>
		<th width="15%">{translate key="manager.announcements.type"}</th>
		<th width="45%">{translate key="manager.announcements.title"}</th>
		<th width="20%">{translate key="common.action"}</th>
	</tr>
</thead>
<tbody>
{iterate from=announcements item=announcement}
	<tr valign="top">
		<td>{$announcement->getDateExpire()|date_format:$dateFormatShort}</td>
		<td>{$announcement->getAnnouncementTypeName()}</td>
		<td>{$announcement->getLocalizedTitle()|escape}</td>
		<td><a href="{url op="editAnnouncement" path=$announcement->getId()}" class="btn btn-warning btn-xs">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="deleteAnnouncement" path=$announcement->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.announcements.confirmDelete"}')" class="btn btn-danger btn-xs">{translate key="common.delete"}</a></td>
	</tr>
	

{/iterate}
{if $announcements->wasEmpty()}
	<tr>
		<td colspan="4" class="nodata">{translate key="manager.announcements.noneCreated"}</td>
	</tr>


{else}
	<tr>
		<td colspan="2" align="left">{page_info iterator=$announcements}</td>
		<td colspan="2" align="right">{page_links anchor="announcements" name="announcements" iterator=$announcements}</td>
	</tr>
{/if}
</tbody>
</table>


</div>
{include file="common/footer.tpl"}

