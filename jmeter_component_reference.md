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

## Pre Processors

Preprocessors are used to modify the samplers in their scope.

### BeanShell PreProcessor

#### Parameters

#### bzt

### JSR223 PreProcessor

The JSR223 PreProcessor allows JSR223 script code to be applied before taking a sample.

#### Parameters

#### bzt

## Post Processors

As the name suggests, Post Processors are applied after samplers.
Note that they are applied to **all** the samplers in the same scope, so to ensure that a post processor is applied only to a particular sampler, add it as a child of the sampler.

### Regular Expression Extractor

Allows the user to extract values from a server response using a Perl-type regular expression.
As a post processor, this element will execute after each sample request in its scope, applying the regular expression, extracting the requested values, generate the template string, and store the result into the given variable name.

#### Parameters

| Attribute | Description | Required |
| --- | --- | --- |
| Name | Descriptive name for this controller that is shown in the tree. | Yes |
| Regular Expression | The regular expression used to parse the response data. | Yes |
| Template | The template used to create a string from the matches found. | Yes |
| Match No. (0 for Random) | Indicates which match to use. | Yes |

#### bzt

```yaml
- url: 'https://${HOST}/api/data'
  method: POST
  label: 'POST https://${HOST}/api/data'
  headers:
    Accept: 'application/json, text/plain, */*'
    Origin: 'https://${HOST}'
    Content-Type: application/json;charset=UTF-8
    Cookie: JSESSIONID=node0cwboa206pqkckilayr0az0qb31465.node0
  body: '{"@id":"!3xhjjgprabp","@context":{"!3xhjjgprabp":{"@id":"!3xhjjgprabp","@type":"ARPSozIhEzcyAJEWs5VJ3j_m","gms:sfo/run/status#!4qhiwwigasr":"draft"}}}'
  extract-regexp:
    RUN_ID:
      regexp: '"@id":"(.*?)",'
      template: 1
      match-no: 1
      default: RUN_ID_NOT_FOUND
    RUN_HASH_1:
      regexp: '"@hash":"(.*?)",'
      template: 1
      match-no: 1
      default: RUN_HASH_1_NOT_FOUND
```

