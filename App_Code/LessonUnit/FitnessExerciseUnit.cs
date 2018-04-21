using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for FitnessExerciseUnit
/// </summary>
public class FitnessExerciseUnit : ExerciseUnit
{
	public FitnessExerciseUnit()
	{
		//
		// TODO: Add constructor logic here
		//
	}

	#region Schema

	public PrizeExerciseUnit prizeExerciseUnit;

	public static class Schema
	{
		public const string AlternateExercise = "AlternateExercise";
		public const string Reps = "Reps";
		public const string Rest = "Rest";
		public const string Weight = "Weight";
		public const string Comments = "Comments";
		public const string UnitOrder = "UnitOrder";
		public const string Tempo = "Tempo";
		public const string TrainningSet = "TrainningSet";
		public const string ExerciseUnit = "FitnessExerciseUnit";
	}

	#endregion

	public string AlternateExercise { get; set; }

	public string Reps { get; set; }

	public string Rest { get; set; }

	public string Weight { get; set; }

	public string Comments { get; set; }

	public string Tempo { get; set; }

	public string TrainningSet { get; set; }

	protected override void WriteXmlCore(XmlWriter writer)
	{
		writer.WriteStartElement(typeof(FitnessExerciseUnit).ToString());
		writer.WriteElementString(Schema.AlternateExercise, AlternateExercise);
		writer.WriteElementString(Schema.Reps, Reps);
		writer.WriteElementString(Schema.Rest, Rest);
		writer.WriteElementString(Schema.Weight, Weight);
		writer.WriteElementString(Schema.Comments, Comments);
		writer.WriteElementString(Schema.Tempo, Tempo);
		writer.WriteElementString(Schema.TrainningSet, TrainningSet);
		base.WriteXmlCore(writer);
		writer.WriteEndElement();
	}

	protected override void ReadXmlCore(XmlReader reader)
	{
		base.ReadXmlCore(reader);
		AlternateExercise = reader.ReadElementString(Schema.AlternateExercise);
		Reps = reader.ReadElementString(Schema.Reps);
		Rest = reader.ReadElementString(Schema.Rest);
		Weight = reader.ReadElementString(Schema.Weight);
		Comments = reader.ReadElementString(Schema.Comments);
		Tempo = reader.ReadElementString(Schema.Tempo);
		TrainningSet = reader.ReadElementString(Schema.TrainningSet);
	}
}