using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using WebMatrix.WebData;

namespace YleanaAdmin.Business
{
	public static class SecurityHelper
	{
		public static bool UserInRole(string role)
		{
			if (Roles.IsUserInRole(role))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}