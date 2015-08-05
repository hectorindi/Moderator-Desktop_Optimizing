/*******************************************************************************
 * Copyright (c) iSpring Solutions, Inc. 
 * All rights reserved. This source code and the accompanying materials are made
 * available under the terms of the iSpring Public License v1.0 which accompanies
 * this distribution, and is available at:
 * http://www.ispringsolutions.com/legal/public-license-v10.html
 *
 *******************************************************************************/


package ispring.as2player.impl
{
	import ispring.as2player.ICompanyInfo;
	import ispring.as2player.ICompanyLogo;
	
	public class CompanyInfo implements ICompanyInfo
	{
		private var m_obj:Object;
		private var m_logo:ICompanyLogo;
		
		public function CompanyInfo(obj:Object)
		{
			m_obj = obj;
		}
		
		public function hasLogo():Boolean
		{
			return m_obj.hasLogo;
		}
		
		public function get logo():ICompanyLogo
		{
			if (!m_logo && m_obj.logo)
			{
				m_logo = new CompanyLogo(m_obj.logo);
			}
			return m_logo;
		}
	}
}
