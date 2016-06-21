{**
 * templates/editor/issues/futureIssues.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Listings of future (unpublished) issues.
 *
 *}
{strip}
{assign var="pageTitle" value="editor.issues.futureIssues"}
{url|assign:"currentUrl" page="editor" op="futureIssues"}
{include file="common/header.tpl"}
{/strip}

	<ul class="nav nav-pills">
		<li class="nav-item "><a href="{url op="createIssue"}" class="nav-link">{translate key="editor.navigation.createIssue"}</a></li>
		<li class="nav-item active"><a href="{url op="futureIssues"}" class="nav-link">{translate key="editor.navigation.futureIssues"}</a></li>
		<li class="nav-item "><a href="{url op="backIssues"}" class="nav-link">{translate key="editor.navigation.issueArchive"}</a></li>
	</ul>
<hr>
	

<div id="issues">
<table width="100%" class="table table-striped">
<thead>
	<tr class="heading" valign="bottom">
		<th width="80%">{translate key="issue.issue"}</th>
		<th width="15%">{translate key="editor.issues.numArticles"}</th>
		<th width="5%" align="right">{translate key="common.action"}</th>
	</tr>
	</thead>
<tbody>
	{iterate from=issues item=issue}
	<tr valign="top">
		<td><a href="{url op="issueToc" path=$issue->getId()}" class="action">{$issue->getIssueIdentification()|strip_unsafe_html|nl2br}</a></td>
		<td>{$issue->getNumArticles()|escape}</td>
		<td align="right"><a href="{url op="removeIssue" path=$issue->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="editor.issues.confirmDelete"}')" class="btn btn-danger btn-xs">{translate key="common.delete"}</a></td>
	</tr>
		
{/iterate}
{if $issues->wasEmpty()}
	<tr>
		<td colspan="3" class="nodata">{translate key="issue.noIssues"}</td>
	</tr>
	
{else}
	<tr>
		<td align="left">{page_info iterator=$issues}</td>
		<td colspan="2" align="right">{page_links anchor="issues" name="issues" iterator=$issues}</td>
	</tr>
{/if}
</tbody>
</table>
</div>
{include file="common/footer.tpl"}

