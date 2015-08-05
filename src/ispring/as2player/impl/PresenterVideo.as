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
	import ispring.as2player.IPresenterVideo;
	
	public class PresenterVideo implements IPresenterVideo
	{
		private var m_obj:Object;
		
		public function PresenterVideo(obj:Object)
		{
			m_obj = obj;
		}
		
		public function get width():Number
		{
			return m_obj.width;
		}
		
		public function get height():Number
		{
			return m_obj.height;
		}
	}
}
