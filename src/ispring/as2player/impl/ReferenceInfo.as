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
	import ispring.as2player.IReferenceInfo;
	
	public class ReferenceInfo implements IReferenceInfo
	{
		private var m_obj:Object;
		
		public function ReferenceInfo(obj:Object)
		{
			m_obj = obj;
		}
		
		public function get title():String
		{
			return m_obj.title;
		}
		
		public function get url():String
		{
			return m_obj.url;
		}
		
		public function get target():String
		{
			return m_obj.target;
		}
	}
}
