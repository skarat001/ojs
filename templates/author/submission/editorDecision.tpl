{**
 * templates/author/submission/editorDecision.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the author's editor decision table.
 *
 *}
<div id="editorDecision">
<h3>{translate key="submission.editorDecision"}</h3>

{assign var=authorFiles value=$submission->getAuthorFileRevisions($submission->getCurrentRound())}
{assign var=editorFiles value=$submission->getEditorFileRevisions($submission->getCurrentRound())}

		<div class="row">
			<div class="col-md-3 ">
				<h5>
					<strong>		

{translate key="editor.article.decision"}
				</strong>
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>

			{if $lastEditorDecision}
				{assign var="decision" value=$lastEditorDecision.decision}
				{translate key=$editorDecisionOptions.$decision}{if $lastEditorDecision.dateDecided != 0} {$lastEditorDecision.dateDecided|date_format:$dateFormatShort}{/if}
			{else}
				&mdash;
			{/if}
	</h5>
			</div>
</div>

		<div class="row">
			<div class="col-md-3 ">
				<h5>
					<strong>		

			{translate key="submission.notifyEditor"}
				</strong>
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>

			{url|assign:"notifyAuthorUrl" op="emailEditorDecisionComment" articleId=$submission->getId()}
			{icon name="mail" url=$notifyAuthorUrl}
			&nbsp;&nbsp;&nbsp;&nbsp;
			{translate key="submission.editorAuthorRecord"}
			{if $submission->getMostRecentEditorDecisionComment()}
				{assign var="comment" value=$submission->getMostRecentEditorDecisionComment()}
				<a href="javascript:openComments('{url op="viewEditorDecisionComments" path=$submission->getId() anchor=$comment->getId()}');" class="icon">{icon name="comment"}</a> {$comment->getDatePosted()|date_format:$dateFormatShort}
			{else}
				<a href="javascript:openComments('{url op="viewEditorDecisionComments" path=$submission->getId()}');" class="icon">{icon name="comment"}</a>{translate key="common.noComments"}
			{/if}

	</h5>
			</div>
</div>
		<div class="row">
			<div class="col-md-3 ">
				<h5>
					<strong>		

			{translate key="submission.editorVersion"}
				</strong>
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>

			{foreach from=$editorFiles item=editorFile key=key}
				<a href="{url op="downloadFile" path=$submission->getId()|to_array:$editorFile->getFileId():$editorFile->getRevision()}" class="file">{$editorFile->getFileName()|escape}</a>&nbsp;&nbsp;{$editorFile->getDateModified()|date_format:$dateFormatShort}<br />
			{foreachelse}
				{translate key="common.none"}
			{/foreach}
	</h5>
			</div>
</div>

			<div class="row">
			<div class="col-md-3 ">
				<h5>
					<strong>		

			{translate key="submission.authorVersion"}
				</strong>
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>

			{foreach from=$authorFiles item=authorFile key=key}
				<a href="{url op="downloadFile" path=$submission->getId()|to_array:$authorFile->getFileId():$authorFile->getRevision()}" class="file">{$authorFile->getFileName()|escape}</a>&nbsp;&nbsp;{$authorFile->getDateModified()|date_format:$dateFormatShort}&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="{url op="deleteArticleFile" path=$submission->getId()|to_array:$authorFile->getFileId():$authorFile->getRevision()}" class="action">{translate key="common.delete"}</a><br />
			{foreachelse}
				{translate key="common.none"}
			{/foreach}
	</h5>
			</div>
</div>

		<div class="row">
			<div class="col-md-3 ">
				<h5>
					<strong>		


			{translate key="author.article.uploadAuthorVersion"}
				</strong>
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
	
			<form method="post" action="{url op="uploadRevisedVersion"}" enctype="multipart/form-data" class="form-horizontal">
				<input type="hidden" name="articleId" value="{$submission->getId()}" />
				<input type="file" name="upload" class="uploadField" />
				<input type="submit" name="submit" class="btn btn-default" value="{translate key="common.upload"}" class="button" />
			</form>
	</h5>
			</div>
</div>

</div>
