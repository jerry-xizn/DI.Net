﻿using Wing.Exceptions;

namespace Wing.Converter
{
    public static class StringExtensions
    {
        public static string RemoveStart(this string val, string toRemove)
        {
            return val.StartsWith(toRemove) ? val.Remove(0, toRemove.Length) : val;
        }

        public static void IsNotNull(this string val)
        {
            if (string.IsNullOrWhiteSpace(val))
            {
                throw new ArgumentEmptyException(nameof(val));
            }
        }
    }
}
