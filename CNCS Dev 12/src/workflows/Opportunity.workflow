<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Concept_Paper_Rejected_Email</fullName>
        <ccEmails>kyama@plan-sys.com</ccEmails>
        <description>Concept Paper Rejected Email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Concept_Paper_Rejected_Email</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert</fullName>
        <description>Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>kkondaveeti@plan-sys.com.go</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Concept_Paper_Under_Review</template>
    </alerts>
    <alerts>
        <fullName>Hold_Pending_Resources_Email</fullName>
        <ccEmails>kyama@plan-sys.com</ccEmails>
        <ccEmails>pmungamuri@plan-sys.com</ccEmails>
        <description>Hold Pending Resources Email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Hold_Pending_Resources_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Field_Update</fullName>
        <field>Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Field_Update3</fullName>
        <field>Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>Field Update3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Field_Update5</fullName>
        <field>Status__c</field>
        <literalValue>Presubmitted</literalValue>
        <name>Field Update5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Changed_to_Pre_Submitted</fullName>
        <field>Status__c</field>
        <literalValue>Presubmitted</literalValue>
        <name>Status Changed to Pre-Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Concept Paper Rejected</fullName>
        <actions>
            <name>Concept_Paper_Rejected_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <description>Send an email when the Approval Status is &quot;Rejected&quot;.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Hold Pending Resources</fullName>
        <actions>
            <name>Hold_Pending_Resources_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Hold Pending Resources</value>
        </criteriaItems>
        <description>Send an email when the Approval Status is &quot;Hold Pending Resources&quot;.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lock The record</fullName>
        <active>true</active>
        <formula>NOFA_RFP_Id__r.Concept_Paper_Due_Date__c &lt;  DATE(2015,04,23)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Field_Update</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Status Changed to Pre-Submitted</fullName>
        <actions>
            <name>Status_Changed_to_Pre_Submitted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Status__c</field>
            <operation>equals</operation>
            <value>InProgress</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
