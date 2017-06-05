# JMeter Component Reference

## Logic Controllers

### Transaction Controller

The Transaction Controller generates an additional sample which measures the overall time taken to perform the nested test elements.

There are two modes of operations:
* additional sample is added after the nested samples
* additional sample is added as a parent of the nested samples

The generated sample is only regarded as successful if all its sub-samples are successful.

In parent mode, the individual samples can still be seen in the Tree View Listener, but no longer appear as separate entries in other Listeners.
Also, the sub-samples do not appear in CSV log files, but they can be saved to XML files.

#### Parameters

| Attribute | Description | Required |
| --- | --- | --- |
| Name | Descriptive name for this controller that is shown in the tree, and used to name the transaction. | Yes |
| Generate Parent Sample | If checked, then the sample is generated as a parent of the other samples, otherwise the sample is generated as an independent sample. | Yes |

#### bzt

```yaml
requests:
  - transaction
    force-parent-sample: True
    do:
      - url: 'http://www.google.com'
      - url: 'http://www.yahoo.com'
```

