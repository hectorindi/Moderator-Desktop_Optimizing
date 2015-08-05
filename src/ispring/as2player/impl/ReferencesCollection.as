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
	import ispring.as2player.IReferencesCollection;
	import ispring.as2player.IReferenceInfo;
	
	public class ReferencesCollection implements IReferencesCollection
	{
		private var m_obj:Object;
		private var m_references:Array;
		
		public function ReferencesCollection(obj:Object)
		{
			m_obj = obj;
			m_references = new Array();
		}
		
		public function get count():Number
		{
			return m_obj.count;
		}
		
		public function getReference(index:Number):IReferenceInfo
		{
			if (!m_references[index] && m_obj.references && m_obj.references[index])
			{
				m_references[index] = new ReferenceInfo(m_obj.references[index])
			}
			return m_references[index];
		}
	}
}
