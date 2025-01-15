using System.Collections.Generic;
using DI.Data.Dtos;

namespace DI.Cms.Data.Dtos
{
    /// <summary>
    ///  文章 对象 cms_article
    ///  author di.net
    ///  date   2025-01-14 13:52:14
    /// </summary>
    public class CmsArticleDto : BaseDto
    {
        /// <summary>
        /// ID
        /// </summary>
        public int ArticleId { get; set; }
                
        /// <summary>
        /// 标题
        /// </summary>
        public string? ArticleTitle { get; set; }
                
        /// <summary>
        /// 作者
        /// </summary>
        public string? ArticleAuthor { get; set; }
                
        /// <summary>
        /// 内容
        /// </summary>
        public string? ArticleContent { get; set; }
                
        /// <summary>
        /// 摘要
        /// </summary>
        public string? ArticleSummary { get; set; }
                
        /// <summary>
        /// 状态
        /// </summary>
        public string? Status { get; set; }
                
    }
}
