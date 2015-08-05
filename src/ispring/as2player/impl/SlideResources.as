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
	import ispring.as2player.ISlideResources;
	import ispring.as2player.IPresenterVideo;
	
	public class SlideResources implements ISlideResources
	{
		private var m_obj:Object;
		private var m_presenterVideo:IPresenterVideo;
		
		public function SlideResources(obj:Object)
		{
			m_obj = obj;
		}
		
		public function hasPresenterVideo():Boolean
		{
			return m_obj.hasPresenterVideo;
		}
		
		public function get presenterVideo():IPresenterVideo
		{
			if (!m_presenterVideo && m_obj.presenterVideo)
			{
				m_presenterVideo = new PresenterVideo(m_obj.presenterVideo);
			}
			return m_presenterVideo;
		}
	}
}
