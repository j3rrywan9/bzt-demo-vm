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

## Configuration Elements

### CSV Data Set Config

CSV Data Set Config is used to read lines from a file, and split them into variables.
It is well suited to handling large numbers of variables, and is also useful for testing with "random" and unique values.

#### Parameters

| Attribute | Description | Required |
| --- | --- | --- |
| Name | Descriptive name for this element that is shown in the tree. | |
| Filename | Name of the file to be read. | Yes |

### HTTP Cookie Manager

### HTTP Header Manager

## Assertions

### Duration Assertion

The Duration Assertion tests that each response was received within a given amount of time.
Any response that takes longer than the given number of milliseconds (specified by the user) is marked as a failed response.

## Timers

### Uniform Random Timer

This timer pauses each thread request for a random amount of time, with each time interval having the same probability of occurring.
The total delay is the sum of the random value and the offset value.

## Pre Processors

### BeanShell PreProcessor

## Post-Processors

### JSON Extractor

## Miscellaneous Features

### Thread Group

A Thread Group defines a pool of users that will execute a particular test case against your server.
In the Thread Group GUI, you can control the number of users simulated (number of threads), the ramp up time (how long it takes to start all the threads), the number of times to perform the test, and optionally, a start and stop time for the test.
