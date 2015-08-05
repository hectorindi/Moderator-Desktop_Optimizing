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
	import ispring.as2player.ICompanyLogo;
	
	public class CompanyLogo implements ICompanyLogo
	{
		private var m_obj:Object;
		
		public function CompanyLogo(obj:Object)
		{
			m_obj = obj;
		}
		
		public function get hyperlinkUrl():String
		{
			return m_obj.hyperlinkUrl;
		}
		
		public function get hyperlinkTarget():String
		{
			return m_obj.hyperlinkTarget;
		}
	}
}
