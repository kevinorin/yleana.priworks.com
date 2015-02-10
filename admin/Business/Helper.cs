using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YleanaAdmin.Business
{
	public class Helper
	{
		public string GenerateRandomPassword()
		{
			var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			var stringChars = new char[8];
			var random = new Random();

			for (int i = 0; i < stringChars.Length; i++)
			{
				stringChars[i] = chars[random.Next(chars.Length)];
			}

			var finalString = new String(stringChars);
			//return finalString;
			return "password";
		}
	}
}