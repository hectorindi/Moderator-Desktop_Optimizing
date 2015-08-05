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
	import ispring.as2player.IPresentersCollection;
	import ispring.as2player.IPresenterInfo;
	
	public class PresentersCollection implements IPresentersCollection
	{
		private var m_obj:Object;
		private var m_presenters:Array;
		
		public function PresentersCollection(obj:Object)
		{
			m_obj = obj;
			m_presenters = new Array();
		}
		
		public function get count():Number
		{
			return m_obj.count;
		}
		
		public function getPresenter(index:Number):IPresenterInfo
		{
			if (!m_presenters[index] && m_obj.presenters && m_obj.presenters[index])
			{
				m_presenters[index] = new PresenterInfo(m_obj.presenters[index]);
			}
			return m_presenters[index];
		}
	}
}
