{**
	* templates/sectionEditor/submission/management.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Subtemplate defining the submission management table.
	*
	*}
	<div id="submission">
		<h3>{translate key="article.submission"}</h3>

		{assign var="submissionFile" value=$submission->getSubmissionFile()}
		{assign var="suppFiles" value=$submission->getSuppFiles()}

		<div class="row">
			<div class="col-md-3">
				<strong> 
					{translate key="article.authors"}
				</strong>
			</div>
			<div class="col-md-6"> 
				{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$submission->getAuthorEmails() subject=$submission->getLocalizedTitle() articleId=$submission->getId()}
				{$submission->getAuthorString()|escape} {icon name="mail" url=$url}
			</div>
		</div>
				<div class="row">
			<div class="col-md-3">
				<strong> 
		{translate key="article.title"}
				</strong>
			</div>
			<div class="col-md-6"> 
		{$submission->getLocalizedTitle()|strip_unsafe_html}</td>
			</div>
		</div>

				<div class="row">
			<div class="col-md-3">
			<span class="inline">
				<strong> 
		{translate key="submission.originalFile"}
				</strong>
				</span>
			</div>
			<div class="col-md-6"> 
		{if $submissionFile}
		<a href="{url op="downloadFile" path=$submission->getId()|to_array:$submissionFile->getFileId()}" class="file">{$submissionFile->getFileName()|escape}</a>&nbsp;&nbsp;{$submissionFile->getDateModified()|date_format:$dateFormatShort}
		{else}
		{translate key="common.none"}
		{/if}
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<span class="inline">
				<strong> 
		{translate key="article.suppFilesAbbrev"}
				</strong>
				</span>
			</div>
			<div class="col-md-6"> 
		{foreach name="suppFiles" from=$suppFiles item=suppFile}
		{if $suppFile->getFileId()}
		<a href="{url op="downloadFile" path=$submission->getId()|to_array:$suppFile->getFileId()}" class="btn btn-link">{$suppFile->getFileName()|escape}</a>
		&nbsp;&nbsp;
		{elseif $suppFile->getRemoteURL() != ''}
		<a href="{$suppFile->getRemoteURL()|escape}" target="_blank" class="btn btn-link">{$suppFile->getRemoteURL()|truncate:20:"..."|escape}</a>
		&nbsp;&nbsp;
		{/if}
		{if $suppFile->getDateModified()}
		{$suppFile->getDateModified()|date_format:$dateFormatShort}&nbsp;&nbsp;
		{else}
		{$suppFile->getDateSubmitted()|date_format:$dateFormatShort}&nbsp;&nbsp;
		{/if}
		<a href="{url op="editSuppFile" from="submission" path=$submission->getId()|to_array:$suppFile->getId()}" class="action">{translate key="common.edit"}</a>
		&nbsp;|&nbsp;
		<a href="{url op="deleteSuppFile" from="submission" path=$submission->getId()|to_array:$suppFile->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="author.submit.confirmDeleteSuppFile"}')" class="action">{translate key="common.delete"}</a>
		{if !$notFirst}
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="{url op="addSuppFile" from="submission" path=$submission->getId()}" class="action">{translate key="submission.addSuppFile"}</a>
		{/if}
		<br />
		{assign var=notFirst value=1}
		{foreachelse}
		{translate key="common.none"}&nbsp;&nbsp;&nbsp;&nbsp;<a href="{url op="addSuppFile" from="submission" path=$submission->getId()}" class="btn btn-success">{translate key="submission.addSuppFile"}</a>
		{/foreach}
					</div>
		</div>

				<div class="row">
			<div class="col-md-3">
				<strong> 
		{translate key="submission.submitter"}
				</strong>
			</div>
			<div class="col-md-6"> 
		{assign var="submitter" value=$submission->getUser()}
		{assign var=emailString value=$submitter->getFullName()|concat:" <":$submitter->getEmail():">"}
		{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$emailString|to_array subject=$submission->getLocalizedTitle|strip_tags articleId=$submission->getId()}
		{$submitter->getFullName()|escape} {icon name="mail" url=$url}

			</div>
		</div>


				<div class="row">
			<div class="col-md-3">
				<strong> 
		{translate key="common.dateSubmitted"}
				</strong>
			</div>
			<div class="col-md-6"> 
		{$submission->getDateSubmitted()|date_format:$dateFormatShort}

			</div>
		</div>

				<div class="row">
			<div class="col-md-3">
				<strong> 
		{translate key="section.section"}
				</strong>
			</div>
			<div class="col-md-6"> 
		{$submission->getSectionTitle()|escape}
		

		<form action="{url op="updateSection" path=$submission->getId()}" method="post" class="form-inline">{translate key="submission.changeSection"} <select name="section" size="1" class="form-control ">{html_options options=$sections selected=$submission->getSectionId()}</select> <br/><input type="submit" value="{translate key="common.record"}" class="btn btn-primary" /></form>
			</div>
		</div>

		{if $submission->getCommentsToEditor()}
		<div class="row">
			<div class="col-md-3">
				<strong> 
		{translate key="article.commentsToEditor"}
				</strong>
			</div>
			<div class="col-md-6"> 
		{$submission->getCommentsToEditor()|strip_unsafe_html|nl2br}
	</div>
		</div>
		{/if}
		{if $publishedArticle}
		<div class="row">
			<div class="col-md-3">
				<strong> 
		{translate key="submission.abstractViews"}
				</strong>
			</div>
			<div class="col-md-6"> 
		{$publishedArticle->getViews()}
	</div>
		</div>	
		{/if}


	</div>

