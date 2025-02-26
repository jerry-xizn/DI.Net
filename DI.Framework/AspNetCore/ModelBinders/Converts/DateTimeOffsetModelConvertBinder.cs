﻿using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.ModelBinding.Metadata;
using DI.Framework.DependencyInjection;
using DI.Framework.Extensions;

namespace DI.Framework.AspNetCore;

/// <summary>
/// <see cref="DateTimeOffset"/> 类型模型转换绑定器
/// </summary>
[SuppressSniffer]
public sealed class DateTimeOffsetModelConvertBinder : IModelConvertBinder
{
    /// <summary>
    /// 转换时间
    /// </summary>
    /// <param name="bindingContext"></param>
    /// <param name="metadata"></param>
    /// <param name="valueProviderResult"></param>
    /// <param name="extras"></param>
    /// <returns></returns>
    public object ConvertTo(ModelBindingContext bindingContext, DefaultModelMetadata metadata, ValueProviderResult valueProviderResult, object extras = default)
    {
        var value = valueProviderResult.FirstValue;
        return Convert.ToDateTime(Uri.UnescapeDataString(value)).ConvertToDateTimeOffset();
    }
}