{**
 * templates/manager/files/index.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Files browser.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.filesBrowser"}
{include file="common/header.tpl"}
{/strip}

{assign var=displayDir value="/$currentDir"}
<h3>{translate key="manager.files.indexOfDir" dir=$displayDir|escape}</h3>

{if $currentDir}
<p><a href="{url op="files" path=$parentDir|explode:"/"}" class="action">&lt; {translate key="manager.files.parentDir"}</a></p>
{/if}

<table width="100%" class="table table-striped">
<thead>
	<tr class="heading" valign="bottom">
		<th></th>
		<th width="25%">{translate key="common.fileName"}</th>
		<th width="25%">{translate key="common.type"}</th>
		<th width="25%">{translate key="common.dateModified"}</th>
		<th width="5%">{translate key="common.size"}</th>
		<th width="20%" align="right">{translate key="common.action"}</th>
	</tr>
	</thead>
	<tbody>
	{foreach from=$files item=file name=files}
	{if $currentDir}
		{assign var=filePath value=$currentDir|concat:"/":$file.name}
	{else}
		{assign var=filePath value=$file.name}
	{/if}
	{assign var=filePath value=$filePath|escape}
	<tr valign="top">
		<td>{if $file.isDir}{icon name="folder"}{else}{icon name="letter"}{/if}</td>
		<td><a href="{url op="files" path=$filePath|explode:"/"}">{$file.name}</a></td>
		<td>{$file.mimetype|escape|default:"&mdash;"}</td>
		<td>{$file.mtime|escape|date_format:$datetimeFormatShort}</td>
		<td>{$file.size|escape|default:"&mdash;"}</td>
		<td align="right" class="nowrap">
			{if !$file.isDir}
				<a href="{url op="files" path=$filePath|explode:"/" download=1}" class="action">{translate key="common.download"}</a>&nbsp;|
			{/if}
			<a href="{url op="fileDelete" path=$filePath|explode:"/"}" onclick="return confirm('{translate|escape:"jsparam" key="manager.files.confirmDelete"}')" class="btn btn-danger btn-xs">{translate key="common.delete"}</a>
		</td>
	</tr>

{foreachelse}
	<tr>
		<td colspan="6" class="nodata">{translate key="manager.files.emptyDir"}</td>
	</tr>

{/foreach}
</tbody>
</table>

<form method="post" action="{url op="fileUpload" path=$currentDir|explode:"/"}" enctype="multipart/form-data" class="form-inline">
<div class="form-group ">


	<input type="file" size="20" name="file" class="form-control" />
	<input type="submit" value="{translate key="manager.files.uploadFile"}" class="btn btn-primary" />

</div>

</form>
<br/>
<form method="post" action="{url op="fileMakeDir" path=$currentDir|explode:"/"}" enctype="multipart/form-data" class="form-inline">
<div class="row">
<div class="col-md-5 col-sm-5">
	<input type="text" size="20" maxlength="255" name="dirName" class="form-control" />
	</div>

	<input type="submit" value="{translate key="manager.files.createDir"}" class="btn btn-primary" />
		</div>
</form>

<p>{translate key="manager.files.note"}</p>

{include file="common/footer.tpl"}

