/*******************************************************************************
 * Copyright (c) iSpring Solutions, Inc. 
 * All rights reserved. This source code and the accompanying materials are made
 * available under the terms of the iSpring Public License v1.0 which accompanies
 * this distribution, and is available at:
 * http://www.ispringsolutions.com/legal/public-license-v10.html
 *
 *******************************************************************************/

package ispring.as3bridge
{
	public class ReferenceInfo
	{
		private var m_title:String;
		private var m_url:String;
		private var m_target:String;
		
		public function ReferenceInfo(internalClass:InternalClass, referenceInfo:Object)
		{
			m_title = referenceInfo.title;
			m_url = referenceInfo.url;
			m_target = referenceInfo.target;
		}
		
		public function get title():String
		{
			return m_title;
		}
		
		public function get url():String
		{
			return m_url;
		}
		
		public function get target():String
		{
			return m_target;
		}
	}
}