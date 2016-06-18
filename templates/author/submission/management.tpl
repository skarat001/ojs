{**
	* templates/author/submission/management.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Subtemplate defining the author's submission management table.
	*
	*}
	<div id="submission">

		<h3>{translate key="article.submission"}</h3>
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
					{translate key="article.authors"}
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
						{$submission->getAuthorString(false)|escape}
					</strong>
				</h5>
			</div>
		</div>
		<div class="row" >

			<div class="col-md-3 ">
				<h5>	
					{translate key="article.title"}
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
						{$submission->getLocalizedTitle()|strip_unsafe_html}
					</strong>
				</h5>
			</div>
		</div>
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
					{translate key="submission.originalFile"}
				</h5>
			</div>
			<div class="col-md-5" >
				<h5>
					<strong>

						{if $submissionFile}
						<a href="{url op="downloadFile" path=$submission->getId()|to_array:$submissionFile->getFileId():$submissionFile->getRevision()}" class="file">{$submissionFile->getFileName()|escape}</a>&nbsp;&nbsp;{$submissionFile->getDateModified()|date_format:$dateFormatShort}
						{else}
						{translate key="common.none"}
						{/if}
					</strong>
				</h5>
			</div>
		</div>
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
					{translate key="article.suppFilesAbbrev"}
				</h5>
			</div>
			<div class="col-md-4" >
				<h5>
					<strong>

						{foreach name="suppFiles" from=$suppFiles item=suppFile}
						<a href="{if $submission->getStatus() != STATUS_PUBLISHED && $submission->getStatus() != STATUS_ARCHIVED}{url op="editSuppFile" path=$submission->getId()|to_array:$suppFile->getId()}{else}{url op="downloadFile" path=$submission->getId()|to_array:$suppFile->getFileId()}{/if}" class="file">{$suppFile->getFileName()|escape}</a>&nbsp;&nbsp;{$suppFile->getDateModified()|date_format:$dateFormatShort}<br />
						{foreachelse}
						{translate key="common.none"}
						{/foreach}

					</strong>
				</h5>
			</div>



			<div class="col-md-3 ">
				<h5>
					{if $submission->getStatus() != STATUS_PUBLISHED && $submission->getStatus() != STATUS_ARCHIVED}
					<a href="{url op="addSuppFile" path=$submission->getId()}" class="btn btn-primary">{translate key="submission.addSuppFile"}</a>
					{else}

					{/if}
				</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3" >
				<h5>


					{translate key="submission.submitter"}
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>

						{assign var="submitter" value=$submission->getUser()}
						{assign var=emailString value=$submitter->getFullName()|concat:" <":$submitter->getEmail():">"}
						{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$submission->getLocalizedTitle()|strip_tags articleId=$submission->getId()}
						{$submitter->getFullName()|escape} {icon name="mail" url=$url}
					</strong>
				</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3" >
				<h5>
					{translate key="common.dateSubmitted"}
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
						{$submission->getDateSubmitted()|date_format:$datetimeFormatLong}
					</strong>
				</h5>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3" >
				<h5>

					{translate key="section.section"}
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
						{$submission->getSectionTitle()|escape}
					</strong>
				</h5>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3" >
				<h5>
					{translate key="user.role.editor"}

					{assign var="editAssignments" value=$submission->getEditAssignments()}

				</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
						{foreach from=$editAssignments item=editAssignment}
						{assign var=emailString value=$editAssignment->getEditorFullName()|concat:" <":$editAssignment->getEditorEmail():">"}
						{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$submission->getLocalizedTitle()|strip_tags articleId=$submission->getId()}
						{$editAssignment->getEditorFullName()|escape} {icon name="mail" url=$url}
						{if !$editAssignment->getCanEdit() || !$editAssignment->getCanReview()}
						{if $editAssignment->getCanEdit()}
						({translate key="submission.editing"})
						{else}
						({translate key="submission.review"})
						{/if}
						{/if}
						<br>
						{foreachelse}
						{translate key="common.noneAssigned"}
						<br>
						{/foreach}


						{if $submission->getCommentsToEditor()}

						{translate key="article.commentsToEditor"}
						<br/>
						{$submission->getCommentsToEditor()|strip_unsafe_html|nl2br}

						{/if}
						{if $publishedArticle}

						{translate key="submission.abstractViews"}
						<br/>
						{$publishedArticle->getViews()}

						{/if}
					</strong>
				</h5>
			</div>
		</div>

	</div>

