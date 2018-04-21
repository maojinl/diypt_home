using System;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;

/// <summary>
/// Summary description for Class1
/// </summary>
public abstract class ExerciseUnit : IXmlSerializable
{
	public ExerciseUnit()
	{
		//
		// TODO: Add constructor logic here
		//
	}

	#region Schema

	public string Exercise { get; set; }
	public string DayGroupName { get; set; }
	public int ExerciseDay { get; set; }
	public string Sequence { get; set; }
	public string Image { get; set; }
	public int TimeDuration { get; set; }
	public int Comment { get; set; }

	public static class Schema
	{

	}

	#endregion

	#region IXmlSerializable Members

	XmlSchema IXmlSerializable.GetSchema()
	{
		return null;
	}

	void IXmlSerializable.WriteXml(XmlWriter writer)
	{

		WriteXmlCore(writer);
		writer.WriteEndElement();
	}



	void IXmlSerializable.ReadXml(XmlReader reader)
	{
		reader.ReadStartElement();
		ReadXmlCore(reader);
		reader.ReadEndElement();
	}

	protected virtual void WriteXmlCore(XmlWriter writer)
	{
	}

	protected virtual void ReadXmlCore(XmlReader reader)
	{
	}
	#endregion

}