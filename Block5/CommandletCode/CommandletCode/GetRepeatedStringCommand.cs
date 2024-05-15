namespace CommandletCode;
using System.Management.Automation;

[Cmdlet(VerbsCommon.Get, "RepeatedString")]
public class GetRepeatedStringCommand : Cmdlet
{
    [Parameter(Position = 0, Mandatory = true, ValueFromPipeline = true, ValueFromPipelineByPropertyName = true)]
    public string InputString { get; set; }

    [Parameter(Position = 1, Mandatory = true)]
    public int RepeatCount { get; set; }

    protected override void ProcessRecord()
    {
        for (int i = 0; i < RepeatCount; i++)
        {
            WriteObject(InputString);
        }
    }
}