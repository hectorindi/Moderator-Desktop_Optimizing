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
	import ispring.as2player.IPresenterInfo;
	
	public class PresenterInfo implements IPresenterInfo
	{
		private var m_obj:Object;
		
		public function PresenterInfo(obj:Object)
		{
			m_obj = obj;
		}
		
		public function get name():String
		{
			return m_obj.name;
		}
		
		public function get title():String
		{
			return m_obj.title;
		}
		
		public function get biographyText():String
		{
			return m_obj.biographyText;
		}
		
		public function get email():String
		{
			return m_obj.email;
		}
		
		public function get webSite():String
		{
			return m_obj.webSite;
		}
		
		public function hasPhoto():Boolean
		{
			return m_obj.hasPhoto;
		}

		public function get index():Number
		{
			return m_obj.index;
		}
	}
}
